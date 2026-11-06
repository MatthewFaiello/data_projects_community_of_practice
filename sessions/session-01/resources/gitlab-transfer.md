# Later GitLab transfer and deployment handoff

Reference for a later guided meeting. Session 1 introduces the roles and records access status in the companion.

# Procedure 4 GitLab transfer preparation

## Purpose and starting point
Copy a tested GitHub repository to the designated DDOE GitLab repository for deployment handoff. This mirrors the supplied DDOE Shiny SOP. The companion records the project-specific access route and destination.

## Prerequisites
- The app runs locally and the intended commits are on GitHub.
- The GitLab project exists and the person transferring has appropriate push permissions.
- The transfer environment can reach both GitHub and DDOE GitLab using the approved network path.
- GitHub is the agreed source for the mirror, and the destination can be made to match it.
- The deployment owner has identified any GitLab-only configuration, branches or tags that need to be retained.

## Mirror behavior
A mirror push can overwrite destination references and delete references that exist only at the destination. Use this procedure only when that result is intended. If GitLab contains independent work that must remain, agree on a branch or merge workflow with the repository owner instead.

## Inspect access
Terminal in the approved transfer environment, with actual URLs substituted:
```text
git ls-remote "GITHUB_HTTPS_URL"
git ls-remote "GITLAB_HTTPS_URL"
```
A populated repository normally lists commit hashes and references. A reachable empty repository can return no references and no error. Permission or network errors need resolution before the transfer.

## Plan the transfer folder
Use a new, dedicated temporary folder outside the working app. A mirror clone is a bare repository intended for transfer. It is not the folder used to edit or launch the app. Keep it available until you finish verification.

Source: supplied DDOE SOP and Git push documentation, linked in [Sources](sources.md).

# Procedure 4 Mirror and verify

## Prepare a fresh mirror
Run in the transfer environment's Terminal. Substitute actual HTTPS URLs first. Start in the parent folder chosen for this transfer.
```text
git clone --mirror "GITHUB_HTTPS_URL" "fafsa_transfer.git"
cd fafsa_transfer.git
git remote add gitlab "GITLAB_HTTPS_URL"
git remote -v
git push --mirror --dry-run gitlab
```
Confirm that `origin` identifies the GitHub source and `gitlab` identifies the intended DDOE destination. Review the dry-run output, including any proposed deletions or forced updates. A dry run previews changes without sending the reference updates, but the live push can still fail if conditions change.

## Perform the intended transfer
After the source, destination and proposed changes are confirmed:
```text
git push --mirror gitlab
git rev-parse refs/heads/main
git ls-remote gitlab refs/heads/main
```
The local mirror's `main` hash and the destination's `refs/heads/main` hash should match. Verify any other intended branches and tags. Open GitLab and confirm the expected app files.

## Recovery
If the destination is wrong or a proposed deletion is unexpected, stop before the live push. If GitLab rejects a protected branch, ask the project Maintainer or deployment owner to resolve the intended workflow. A rejected push is not a reason to change protection settings automatically.

Once the destination is verified, leave the mirror folder and remove only that dedicated temporary copy using your normal file-management process. Preserve the working app directory.

## Deployment is the next action
The repository transfer prepares the handoff. Use the deployment request on the next page to ask the deployment owner to deploy the intended version.

# Deployment handoff and troubleshooting

## Handoff fields
Record the app name, GitHub URL, GitLab URL, branch and full commit hash. Include the target server folder or URL, required R packages, app input files, and the requested initial deployment or refresh. Record relevant server requirements and the local checks performed.

For this practice app the package list is `shiny`, `bslib`, `tidyverse` and `scales`. The app input is `input_data/fafsa_completion.csv`. Use the actual deployment target supplied for the project.

After deployment, check the target app, its inputs and outputs, and the version the deployment owner reports deploying. Keep the request and verification result with the project record.

## Troubleshooting checks
| Symptom | Diagnostic next step |
| --- | --- |
| Git is unavailable | Confirm installation and RStudio's configured executable |
| Git pane is missing | Reopen the project and check version-control settings |
| origin already exists | Inspect git remote -v before changing a URL |
| Push is rejected | Read the error and inspect destination and history |
| A file is still tracked after an ignore rule | Review its tracked state before changing the index |
| GitLab is unreachable | Confirm the approved network path and account permissions |
| Protected branch rejects transfer | Contact the repository Maintainer or deployment owner |

An ignore rule does not remove a file already tracked by Git. Review the intended repository contents before deciding how to stop tracking an existing file. Do not assume that removing a working file removes it from history.

## Reference locations
[Sources](sources.md) links the official Posit, Git and GitHub documentation and names the supplied DDOE source materials. The [resource index](README.md) links short commands and prompts. The companion records current organization-specific access details.

Procedure version 2.0. Prepared 6 November 2026 for the course repository.
