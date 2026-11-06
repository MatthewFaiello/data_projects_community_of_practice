# Session 1 companion guide
R projects and GitHub for the DDOE community of practice

Use the FAFSA Shiny app to open an organized R project and record a small change in your own private GitHub repository. Imagine a colleague needs to refresh the app while you are away. What would they need to find and run, and how would they identify the version ready for handoff?

Keep this guide and the practice app open during the meeting. The [Session 1 page](README.md) links the deck and supporting resources. The exercise takes about 90 minutes, including 45 minutes for GitHub setup and a title change.

## Before the meeting
- Confirm that R and RStudio start. In RStudio's Terminal, run `git --version` and check that a version appears.
- Sign in to GitHub. Create an empty private repository for your practice app. Leave its README, license and gitignore options unselected.
- [Download the FAFSA starter ZIP](practice/fafsa_template.zip). Extract it outside the course repository and any other Git repository. Work in the extracted files.
- Open `fafsa_template/fafsa_template.Rproj`. Complete page 2 to confirm that the app runs before the meeting.

Install missing packages in the R Console through the route approved for your computer:
```r
install.packages(c("shiny", "bslib", "tidyverse", "scales"))
```
The [setup reference](resources/getting-ready.md) includes account, RStudio and Terminal access checks. Bring any setup error and your practice repository URL to the meeting.

## The course and your practice repository
The shared course repository holds learning materials. Your private practice repository will hold the extracted app and its change history. Download the app starter separately even if you have cloned the course repository.

## Where commands run
The R Console runs R code. RStudio's Terminal runs Git commands. PowerShell, Git Bash, zsh and bash are Terminal shells. Replace uppercase placeholders with your actual values and read the expected result before continuing.

For help, use the [ChatGPT context and prompts](prompts/README.md) with your operating system, shell, current step and actual output. Prompt P2 inspects Git setup; P3 explains an unexpected result.
<!-- page -->
# Open and understand the app

## Open the project
Open the extracted `fafsa_template.Rproj`. Run in the R Console:
```r
getwd()
file.exists("fafsa_template.Rproj")
file.exists(file.path("input_data", "fafsa_completion.csv"))
```
Expected result: the working directory ends in the extracted `fafsa_template` folder and both file checks return `TRUE`.

Restart R using Session > Restart R, then run in the R Console:
```r
shiny::runApp()
```
The app should open at school year 2026. Change the LEA and school and observe the chart. Stop the app before entering more R Console commands. The fixed snapshot spans 2015 through 2027; year 2027 intentionally has no receipt months and displays the no-data message.

## File responsibilities
Matt uses this layout for this app. Other layouts can serve the same purposes.

| Location | Responsibility |
| --- | --- |
| global.R | Packages, input, shared setup and labels |
| ui.R and server.R | Interface and reactive connections |
| R/ | Analysis and plotting helpers |
| input_data/ | Summarized CSV read by the app |
| www/ | Browser styles and header image |
| prep/ and documentation/ | Upstream work and supporting explanations |

In `global.R`, find:
```r
APP_DATA_PATH <- file.path("input_data", "fafsa_completion.csv")
```
`file.path()` constructs the path from the app project folder; the read step in `global.R` loads the CSV. Opening `.Rproj` establishes the working directory. Packages, Git initialization and a GitHub remote need their own setup.

Checkpoint: the app runs and you can locate its input and main files. The [app explanation](resources/fafsa-project.md) provides more detail.
<!-- page -->
# Git and the project

## The pieces and their jobs
| Piece | Role in the supplied DDOE Shiny workflow |
| --- | --- |
| Git | Records selected versions locally |
| GitHub | Holds the private development repository |
| DDOE GitLab | Receives the tested repository for handoff |
| Shiny Server | Runs the deployed app |

GitHub and GitLab have overlapping capabilities. These particular roles come from the supplied DDOE deployment procedure.

Saving updates a working file. Staging selects contents for the next commit. A commit records that selection locally. Pushing sends committed work to a remote repository.

## Inspect in the Terminal
Confirm the Terminal is in the extracted app folder. Use `Get-Location` in PowerShell or `pwd` in macOS, Linux or Git Bash, then run:
```text
git --version
git status
git rev-parse --show-toplevel
```
The clean starter has no Git repository. The last two commands should report that it is not a Git repository. If they return a repository root, inspect it with Matt before continuing. A parent course repository is the wrong starting point for this exercise.

## Initialize the clean starter
Once the intended folder is confirmed, replace your name and commit email and run:
```text
git init
git branch -M main
git config user.name "YOUR NAME"
git config user.email "YOUR COMMIT EMAIL"
git status
```
Expected result: branch `main`, no commits yet, and untracked files. Commit identity and GitHub authentication are separate.

Review `.gitignore`. This app-only practice repository includes runtime code, assets and the summarized CSV. It excludes preparation, documentation, local state, secrets and deployment records. Preparation code can have another version-controlled home. The [Git reference](resources/git-reference.md) explains the terms and checks.
<!-- page -->
# Connect your practice project to GitHub

## Record the starting version
In the Terminal, stage the named app paths and review the selection:
```text
git add .gitignore README.md fafsa_template.Rproj
git add global.R ui.R server.R R/ input_data/ www/
git diff --cached --stat
git status
```
Expected result: app code, assets, project records and the summarized input are staged. Preparation, documentation, local state and deployment settings should be absent.

When the selection is correct:
```text
git commit -m "Add FAFSA training app"
git log -1 --oneline
```
The initial commit appears with a short identifier, called its hash.

## Add your own remote
Open the empty private practice repository created before the meeting. Copy its HTTPS URL. It should be your exercise repository, separate from the course repository.

Replace the example account and repository before running:
```text
git remote add origin "https://github.com/YOUR_ACCOUNT/YOUR_REPO.git"
git remote -v
```
Confirm that both `origin` entries identify your intended practice repository, then run:
```text
git push -u origin main
```
Complete authentication if prompted. On GitHub, confirm branch `main`, the app files and the initial commit. Reopen `.Rproj` if RStudio's Git pane is missing.

Checkpoint: the same initial commit exists locally and on GitHub. If `origin` already exists or a push is rejected, inspect the remote, branch and exact error before choosing a fix. The [Git and GitHub procedures](resources/git-and-github.md) provide the full reference.
<!-- page -->
# Make and verify a small change

## Edit and test
In `global.R`, change this line:
```r
APP_TITLE <- "FAFSA Completion"
```
to:
```r
APP_TITLE <- "FAFSA Completion - Practice"
```
Save, restart R and run `shiny::runApp()` in the R Console. Check the header and stop the app.

## Inspect and record in the Terminal
```text
git diff -- global.R
git add global.R
git diff --cached -- global.R
git commit -m "Label FAFSA app as practice"
git remote -v
```
The unstaged diff shows the old title with a minus prefix and the new title with a plus prefix. After staging, the cached diff shows the selected change. Re-stage if you edit the file again before committing.

Confirm the intended remote, then run:
```text
git push
git status
git rev-parse HEAD
```
On GitHub, open the latest `main` commit. Its short identifier should match the beginning of the full local hash. Each participant's hash can differ. A clean working tree describes local state; checking GitHub confirms the shared version.

## The RStudio Git pane
Diff, the Staged checkbox, Commit and Push perform the same actions. Use either the pane or the Terminal for each action. A commit already made in the Terminal does not need to be repeated in the pane.

Checkpoint: identify the title in the app, the one-line diff and the same commit locally and online. The repository has [copyable commands](resources/README.md#copyable-command-files) and [actual diff output](resources/commands/Title_Change_Diff.txt).
<!-- page -->
# Practice and next steps

## Before the next meeting
Make one small wording change in `ui.R` to the sentence beginning `Track cumulative FAFSA completion`. Preserve its meaning. Save and test, inspect the diff, stage `ui.R`, commit and push. Bring the commit or a specific question.

## GitLab preview and access
In the supplied DDOE workflow, the tested GitHub version is transferred to the designated GitLab project. The deployment owner then deploys the app to Shiny Server. A repository transfer and a server deployment are separate actions. A later meeting will practice the transfer and compare commit identifiers.

Record the route Matt confirms. Access details belong in your own copy of this guide.

| Access item | Your confirmed detail |
| --- | --- |
| Request contact or service route | ______________________________ |
| Account or sign-in instructions | ______________________________ |
| Approved network path | ______________________________ |
| GitLab group and project | ______________________________ |
| Project creator and permissions | ______________________________ |

Bring your access status even if a request is blocked. The [later GitLab procedure](resources/gitlab-transfer.md) explains transfer behavior; the [deployment request](resources/deployment-request.txt) lists handoff fields. These are linked references for the later exercise.

## Help from ChatGPT
Use the [context file](prompts/CHATGPT_CONTEXT.md), this guide and the relevant code. Start with this prompt and replace its brackets:
```text
I am on companion page [number]. My OS and Terminal shell
are [details]. I ran [command] in [R Console or Terminal].
The output was [relevant output]. I expected [result].
Explain what this shows. Give one diagnostic step,
where to run it, and what result to expect.
```
The repository has [prompts P1 through P4](prompts/README.md), a [command reference](resources/git-reference.md) and [sources](resources/sources.md). Use the training files and omit passwords, tokens and confidential records.
