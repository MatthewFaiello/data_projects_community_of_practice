# Session 1 slide text and speaker notes

Version 2.0. Prepared 6 November 2026.

The live deck and companion are the two main learning files. Supporting resources are linked from the [session page](README.md).

## Slide 1 Getting your R project set up

R Shiny Community of Practice at DDOE

Session 1
Matt Faiello

### Speaker notes

Welcome folx to the ongoing DDOE community of practice. Use the FAFSA app throughout. The goal is for another analyst to open the project and understand its files and recorded changes. Use the slide deck for the conversation and the companion for preparation, commands and follow-up. Supporting procedures and prompts are linked from the repository. Allow questions throughout. Suggested agenda: 0 to 10 app and handoff scenario, 10 to 25 project tour, 25 to 35 Git roles, 35 to 80 GitHub exercise, 80 to 90 GitLab preview. The supplied logo comes from www/Website-Header.png in the app.

## Slide 2 Session 1 materials

Keep the companion guide and practice app open.

[Companion guide](https://github.com/MatthewFaiello/data_projects_community_of_practice/blob/main/sessions/session-01/companion.md)

Preparation, exercise steps and follow-up

[FAFSA starter ZIP](https://github.com/MatthewFaiello/data_projects_community_of_practice/raw/refs/heads/main/sessions/session-01/practice/fafsa_template.zip)

Extract outside the course repository

[Supporting resources](https://github.com/MatthewFaiello/data_projects_community_of_practice/blob/main/sessions/session-01/resources/README.md)

Commands, procedures and source links

[ChatGPT context and prompts](https://github.com/MatthewFaiello/data_projects_community_of_practice/blob/main/sessions/session-01/prompts/README.md)

Use the relevant files and your actual output

[Course home on GitHub](https://github.com/MatthewFaiello/data_projects_community_of_practice)

### Speaker notes

Orient folx to two main learning files: the slide deck and companion document. The companion is also available as Markdown in the repository for reading, copying and use with ChatGPT. The other materials are linked resources. Participants download the separate FAFSA starter ZIP and extract it outside the course repository and any other Git repository, then create their own private app practice repositories. This course repository is the home for shared learning materials. Repository: https://github.com/MatthewFaiello/data_projects_community_of_practice

## Slide 3 The FAFSA practice app

What changes when we choose a different LEA or school?

Supplied guide, year 2023. Live practice opens at 2026.

In the live app

Choose an LEA and school.

Observe the chart and labels.

Ask what the app needs to run.

### Speaker notes

Minutes 0 to 5. Show the live FAFSA practice app immediately and change a filter. This screenshot is a backup from slide 5 of the supplied FAFSA_Completion_App_Guide.pptx. It shows year 2023, while the training copy opens at 2026. The image is an existing reference, not a fresh run of this training copy. Use the supplied snapshot as a teaching example. Invite folx to describe what updates when a filter changes. They will open their own project after the opening conversation. Main live resources: the app and participant walkthrough. The separate starter is linked from the materials slide and session README.

## Slide 4 A colleague needs to refresh the app

What would your colleague need to find, run and verify?

You are away. A colleague needs to refresh the FAFSA app.

Find the summarized input and the code that reads it.

Open the project and run the app.

Identify the version ready for handoff.

### Speaker notes

Minutes 5 to 10. Pose a hypothetical DDOE handoff: a colleague needs to refresh the FAFSA app while you are away. Ask for one or two answers. Keep the answers visible in the conversation and return to them when introducing the input path, README, Git history and tested handoff version. This is a teaching scenario, not a report of an actual incident. Matt can briefly connect another calculation review or data refresh example, while FAFSA remains the project everyone uses.

## Slide 5 The RStudio Project

Open fafsa_template/fafsa_template.Rproj in the extracted starter

```text
getwd()
file.exists("fafsa_template.Rproj")
file.exists(file.path("input_data", "fafsa_completion.csv"))
```

R Console: the app folder is the working directory.

Both file checks should return TRUE.

Project steps in the companion

Use the extracted starter, outside any course checkout.

### Speaker notes

Minutes 10 to 25. Participants use the starter ZIP, extracted outside the course repository and any other Git repository. Open fafsa_template.Rproj and run the three checks in the R Console. The folder should be the extracted app folder and both file checks should return TRUE. Restart R and run shiny::runApp() to launch the practice app. The companion project section is page 2. Opening .Rproj establishes project context; package installation and GitHub connection are separate. Source: https://docs.posit.co/ide/user/ide/guide/code/projects.html

## Slide 6 A project relative path

```text
file.path("input_data", "fafsa_completion.csv")
```

Start at the app project folder.

Find the input_data folder.

Identify the named CSV.

What would happen if R started in a different folder?

### Speaker notes

Find APP_DATA_PATH in global.R. Explain how file.path constructs this path and how the current working folder supplies its starting point. The intention is that the same project organization works on another analyst's computer. Restart R and run shiny::runApp() after checking packages. The training copy opens at 2026. Year 2027 intentionally has no receipt months in this fixed snapshot. Source: supplied global.R and app README. Project working directory behavior: https://docs.posit.co/ide/user/ide/guide/code/projects.html In the opening tour, make clear that file.path constructs a path and the read step in global.R loads the CSV.

## Slide 7 The FAFSA project directory

This is Matt's layout. Other layouts can serve the same purposes.

```text
fafsa_template/
```

```text
fafsa_template.Rproj
```

Open the project

```text
global.R
```

Shared setup and input path

```text
ui.R   server.R
```

Interface and reactive connections

```text
R/
```

Analysis and plotting helpers

```text
input_data/
```

Summarized CSV

```text
www/
```

Styles and header image

```text
prep/   documentation/
```

Preparation and explanations

### Speaker notes

Minutes 10 to 25, after opening the .Rproj and checking the input path. These names are taken from the supplied practice project. Open the actual RStudio Files pane to locate them. This slide is an editable directory map, not an RStudio screenshot. Point to global.R for shared setup and the input path, ui.R and server.R for the interface and reactive connections, R/ for reusable helpers, input_data/ for summarized input, www/ for browser assets, and prep/ and documentation/ for upstream work and supporting explanations. A single app.R or other structures can also work. Sources: supplied app files and https://shiny.posit.co/r/articles/build/app-formats/

## Slide 8 Preparation and runtime files

Where will preparation code be maintained and versioned?

| Part of the work | FAFSA example |
| --- | --- |
| Upstream preparation | SQL and QA scripts in prep/ |
| Runtime input | input_data/fafsa_completion.csv |
| Running app | global.R, ui.R, server.R, R/ and www/ |
| App-only Git repository | Tracks runtime files and selected project records |

### Speaker notes

Distinguish upstream preparation from the runtime files. The downloadable starter includes prep/ and documentation/ for context, while its app-only .gitignore excludes them from the private app exercise repository. This does not imply preparation code has no value; give it a suitable version-controlled home. The course repository holds learning materials and is separate from each app repository. The summarized CSV is enough for this exercise. Source: supplied FAFSA README and shiny_deploy_sop.docx.

## Slide 9 Git and repository hosting

GitHub and GitLab roles here come from the documented workflow

| Piece | Role in the supplied DDOE workflow |
| --- | --- |
| Git | Records selected versions on the local computer |
| GitHub | Holds the private development repository |
| DDOE GitLab | Receives the tested repository for handoff |
| Shiny Server | Runs the deployed app |

### Speaker notes

Minutes 25 to 35: distinguish Git from hosting services and server runtime. GitHub and GitLab have overlapping capabilities. Their specific development and handoff roles come from the supplied DDOE SOP. The handoff request asks the deployment owner to deploy the GitLab repository. This is distinct from simply pushing commits. Sources: supplied shiny_deploy_sop.docx and shiny_deployment_ticket_template.txt. RStudio remote repository context: https://docs.posit.co/ide/user/ide/guide/tools/version-control.html

## Slide 10 Saving, staging, committing and pushing

At which point can someone else find your change on GitHub?

Save

Update the working file

Stage

Select contents for the next commit

Commit

Record that selection locally

Push

Send committed work to the remote

### Speaker notes

Use the title exercise as a concrete example at each stage. Staging selects the current contents of a file. An edit after staging needs re-staging if it belongs in the same commit. Git diff shows tracked unstaged edits. Git diff --cached shows the staged contents. Commit identity and remote authentication are separate. Sources: https://git-scm.com/docs/git-add and https://git-scm.com/docs/git-diff and https://git-scm.com/docs/git-push

## Slide 11 A prompt with enough context

```text
Goal: Connect my FAFSA practice project to GitHub.
Setup: [Operating system and Terminal shell.]
Current state: [Location, Git status and remote.]
Help: Explain my state and the next diagnostic step.
Check: Tell me what result to expect.
```

Use the repository context file and prompt P2.

Discuss assumptions before running the next command.

What information would change the command ChatGPT suggests?

### Speaker notes

Begin the GitHub exercise around minute 35 and allow 45 minutes through the verified title-change push. Open prompt P2 from the repository when it helps interpret actual state. Use the context file, current folder, shell, Git status and repository root. Discuss which folder or remote a proposed command affects and what result to expect. The prompts are teaching examples. The full prompt is at https://github.com/MatthewFaiello/data_projects_community_of_practice/blob/main/sessions/session-01/prompts/README.md#p2-inspect-a-github-connection

## Slide 12 Inspection before setup

RStudio Terminal

```text
git --version
git status
git rev-parse --show-toplevel
```

Check the folder with Get-Location in PowerShell or pwd in bash/zsh.

The clean starter should report that it is not a Git repository.

If a repository exists, inspect its root and git remote -v.

Which starting state do you actually have?

### Speaker notes

Start the GitHub exercise by inspecting the extracted app folder, as described on companion page 3. A fresh starter has no inherited Git history, but it can sit inside a parent repository if extracted there. If git status succeeds, inspect git rev-parse --show-toplevel. Move a fresh starter outside the course checkout before initialization if needed. Preserve existing history. Sources: https://docs.posit.co/ide/user/ide/guide/tools/version-control.html and https://git-scm.com/docs/git-status

## Slide 13 The initial GitHub connection

Exact commands in the companion

| Step | Visible check |
| --- | --- |
| Initialize Git in the intended folder | Branch main and no commits yet |
| Stage and commit the app files | Initial commit appears in local history |
| Add the private practice remote | git remote -v shows the intended URL |
| Push main to origin | The same commit appears on GitHub |

### Speaker notes

Follow companion pages 3 and 4. Confirm the intended app folder, initialize Git, set repository-local commit identity, stage the named app paths and inspect the staged summary. Make the initial commit. Open the empty private practice repository prepared before the meeting, or create one if needed. It is separate from the shared course repository. Copy its HTTPS URL and inspect git remote -v before the first push. Verify the initial commit on GitHub. Source: https://docs.github.com/en/migrations/importing-source-code/using-the-command-line-to-import-source-code/adding-locally-hosted-code-to-github

## Slide 14 A visible title change

Where does this edit exist before the next commit?

```text
git diff -- global.R
```

```text
--- a/global.R
```

```text
+++ b/global.R
```

```text
@@ -27,5 +27,5 @@ library(scales)
```

```text
-APP_TITLE <- "FAFSA Completion"
```

```text
+APP_TITLE <- "FAFSA Completion - Practice"
```

Actual local output, excerpt. Full copyable diff in the repository.

Save, restart R, run the app and check the header.

### Speaker notes

Follow companion page 5. Change APP_TITLE in global.R, save, restart R, run shiny::runApp() and check the header before staging. This editable excerpt is actual git diff output from a disposable local copy of the practice app with only the intended title edit. Minus identifies removed text and plus identifies added text. Full output: https://github.com/MatthewFaiello/data_projects_community_of_practice/blob/main/sessions/session-01/resources/commands/Title_Change_Diff.txt. Source: supplied global.R and https://git-scm.com/docs/git-diff

## Slide 15 Find the same actions in RStudio

Use the live FAFSA project to inspect the staged file list.

Posit reference image. Different example project.

Inspect Diff, choose Staged, then Commit and Push.

### Speaker notes

This reference screenshot comes from Posit documentation and shows a different example project. It locates Diff, the Staged column, Commit, Pull and Push. The supplied screenshot contains untracked .gitignore and version-control.Rproj files. It does not show the FAFSA title edit or a successful participant push. Only unused lower whitespace is cropped. In the live FAFSA project, open the Git pane after initializing and reopening the project if needed. Review named app paths and the .gitignore before the initial commit. During the title exercise, stage global.R and inspect the staged diff. Use the Terminal commands or matching pane controls once, without repeating a commit already made. Included/excluded paths remain in the companion and linked procedures. Source: https://docs.posit.co/ide/user/ide/guide/tools/version-control.html and its image https://docs.posit.co/ide/user/ide/guide/tools/images/git-tab.png

## Slide 16 The change on GitHub

Terminal after saving and testing

```text
git add global.R
git diff --cached -- global.R
git commit -m "Label FAFSA app as practice"
git push
git rev-parse HEAD
```

Confirm the intended remote before pushing.

Compare the local identifier with the latest GitHub commit.

A clean working tree describes local state. Check the remote too.

### Speaker notes

Show either Terminal staging or the matching Git pane action, and avoid duplicating an already completed commit. Verify the staged diff before committing. The local full hash and the beginning shown on GitHub should agree. Each participant's hash differs, so compare their own local and online version. Explain that git status alone does not prove the remote received a push. Sources: https://docs.posit.co/ide/user/ide/guide/tools/version-control.html and https://git-scm.com/docs/git-push The matching steps are on companion page 5.

## Slide 17 GitLab deployment handoff

GitLab transfer reference for the next meeting

| Stage | What to verify |
| --- | --- |
| Tested version on GitHub | Intended files, branch and commit |
| Transfer to designated GitLab project | Source, destination and proposed changes |
| Repository check in GitLab | Matching branch and commit |
| Deployment request and server check | Target, packages, input files and deployed app |

### Speaker notes

Minutes 80 to 90. Preview the supplied DDOE handoff, then use the access section on companion page 6. The transfer environment must reach both services through the approved access path. A mirror can overwrite or delete destination references. The linked later procedure includes inspection, dry run, live push and verification. A GitLab transfer is distinct from the separate server deployment request. Confirm access details rather than inventing contacts or permission rules. Sources: supplied shiny_deploy_sop.docx and deployment ticket; https://git-scm.com/docs/git-push. Later procedure: https://github.com/MatthewFaiello/data_projects_community_of_practice/blob/main/sessions/session-01/resources/gitlab-transfer.md

## Slide 18 Practice before the next meeting

01

Make one small explanatory wording change in ui.R.

02

Test it, inspect the diff, commit and push.

03

Bring the commit or a question.

04

Record your GitLab access status in the companion.

Take-home practice and GitLab access in the companion

### Speaker notes

Close with the practice task on companion page 6. Make one small explanatory wording change in ui.R, in the sentence beginning Track cumulative FAFSA completion. Preserve its meaning, test, inspect the diff, commit and push. Bring the commit or a question. Participants record the confirmed GitLab route and their own access status in their personal companion copy. Use those results to plan the next meeting. The repository links all supporting resources.
