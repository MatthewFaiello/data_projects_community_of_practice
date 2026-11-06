# Quick reference and ChatGPT prompts
Session 1 FAFSA practice project

Use this reference with the [companion](../companion.md) and [ChatGPT context](../prompts/CHATGPT_CONTEXT.md). Start a help request with the relevant files or excerpt, your current step and the actual output. Treat suggested commands as instructions to understand and verify before running.

## Vocabulary
| Term | Meaning in this session |
| --- | --- |
| Project root | Folder containing the app's .Rproj and top-level app files |
| Relative path | File location described from the current starting folder |
| Repository | Project files and the history Git records for them |
| Working tree | Files you are currently editing |
| Stage or index | Selection of file contents prepared for the next commit |
| Commit | Recorded local checkpoint with an identifier and message |
| Remote | Named repository address, such as origin |
| Push | Send commits and reference updates to a remote |
| Clone | Create a local copy of a repository and its history |
| Branch | A named line of development, such as main |

## Where commands run
R Console runs R, including `getwd()` and `shiny::runApp()`. RStudio's Terminal runs Git commands. PowerShell is one possible Terminal shell. macOS commonly uses zsh or bash. Identify your shell when asking for commands.

The `.Rproj` opens the project context. Git records changes in the project folder. The remote supplies the GitHub address. RStudio's Git pane provides controls for that configured repository.

## What to share with ChatGPT
Include the goal, setup, current state, help requested and intended check. Use training files and short relevant output. Keep account credentials and confidential records outside the prompt.

# Commands and expected results

## R Console
```r
getwd()
file.exists("fafsa_template.Rproj")
file.exists(file.path("input_data", "fafsa_completion.csv"))
shiny::runApp()
```
The first command identifies the working folder. The file checks should return `TRUE` from the app root. Run the app only after dependencies are installed. Stop it before more Console work.

## Terminal inspection
| Command | What to inspect |
| --- | --- |
| git --version | Git can be found by this Terminal |
| git status | Branch and staged, unstaged or untracked files |
| git rev-parse --show-toplevel | Actual Git repository root |
| git remote -v | Fetch and push destinations |
| git diff -- global.R | Unstaged edits in the tracked file |
| git diff --cached -- global.R | Staged contents for the next commit |
| git log -1 --oneline | Latest local commit and message |
| git rev-parse HEAD | Full identifier of the local commit |

For the folder location, use `Get-Location` in PowerShell or `pwd` in macOS, Linux or Git Bash. Before initialization, repository inspection commands can report that no Git repository exists. That is expected for the clean starter.

## Routine title update
After saving and testing the title change:
```text
git add global.R
git diff --cached -- global.R
git commit -m "Label FAFSA app as practice"
git push
```
Check `git remote -v` before pushing and verify the commit on GitHub afterward. The [Git and GitHub procedures](git-and-github.md) cover initial setup. [GitLab transfer](gitlab-transfer.md) is a later exercise.
