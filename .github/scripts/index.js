#!/usr/bin/env node

const fs = require("fs");
const process = require("process");

const { Octokit } = require("@octokit/rest");
const fetch = require("node-fetch");
const Diff = require("diff");

const defaultSizes = {
  0: "XS",
  5: "S",
  50: "M",
  500: "L",
  1000: "XL"
};

const actions = ["opened", "synchronize", "reopened"];

module.exports = async ({ context, core }) => {
  const eventDataStr = await readFile(process.env.GITHUB_EVENT_PATH);
  const eventData = JSON.parse(eventDataStr);

  if (!eventData || !eventData.pull_request || !eventData.pull_request.base) {
    throw new Error(`Invalid process.env.GITHUB_EVENT_PATH contents: ${eventDataStr}`);
  }

  if (!actions.includes(eventData.action)) {
    console.log("Action will be ignored:", eventData.action);
    return false;
  }

  const octokit = new Octokit({
    auth: process.env.CI_GITHUB_TOKEN,
          request: {
        fetch,
      },
  });

  const pullRequest = await octokit.rest.pulls.get({
    owner: context.payload.repository.owner.login,
    repo: context.payload.repository.name,
    pull_number: context.payload.issue.number,
  });

  const pullRequestDiff = await octokit.pulls.get({
    ...pullRequestHome,
    pull_number,
    headers: {
      accept: "application/vnd.github.v3.diff"
    }
  });

  const changedLines = getChangedLines(pullRequestDiff.data);
  const sizes = getSizesInput();
  const sizeLabel = getSizeLabel(changedLines, sizes);

  const { add, remove } = getLabelChanges(
    sizeLabel,
    eventData.pull_request.labels
  );

  if (add.length === 0 && remove.length === 0) {
    console.log("Correct label already assigned");
    return false;
  }

  if (add.length > 0) {
    await octokit.issues.addLabels({
      ...pullRequestHome,
      issue_number: pull_number,
      labels: add
    });
  }

  for (const label of remove) {
    try {
      await octokit.issues.removeLabel({
        ...pullRequestHome,
        issue_number: pull_number,
        name: label
      });
    } catch (error) {
      console.error(error);
    }
  }

  return true;
}

async function readFile(path) {
  return new Promise((resolve, reject) => {
    fs.readFile(path, { encoding: "utf8" }, (err, data) => {
      if (err) {
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

function getChangedLines(diff) {
  return Diff.parsePatch(diff)
    .flatMap(file => file.hunks
    )
    .flatMap(hunk => hunk.lines)
    .filter(line => line[0] === "+" || line[0] === "-").length;
}

function getSizeLabel(changedLines, sizes = defaultSizes) {
  let label = null;
  for (const lines of Object.keys(sizes).sort((a, b) => a - b)) {
    if (changedLines >= lines) {
      label = `size/${sizes[lines]}`;
    }
  }
  return label;
}

function getLabelChanges(newLabel, existingLabels) {
  const add = [newLabel];
  const remove = [];
  for (const existingLabel of existingLabels) {
    const { name } = existingLabel;
    if (name.startsWith("size/")) {
      if (name === newLabel) {
        add.pop();
      } else {
        remove.push(name);
      }
    }
  }
  return { add, remove };
}

function getSizesInput() {
  let inputSizes = process.env.INPUT_SIZES;
  if (inputSizes && inputSizes.length) {
    return JSON.parse(inputSizes);
  } else {
    return undefined;
  }
}

if (require.main === module) {
  main().then(
    () => (process.exitCode = 0),
    e => {
      process.exitCode = 1;
      console.error(e);
    }
  );
}


