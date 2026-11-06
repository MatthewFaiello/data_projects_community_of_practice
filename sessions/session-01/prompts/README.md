# ChatGPT prompts for Session 1

Use the [ChatGPT context](CHATGPT_CONTEXT.md), the relevant [companion section](../companion.md), and your actual output.


## P1 Understand this project
```text
Goal: Understand the FAFSA project before making a change.

Setup: I am a DDOE analyst who knows basic R and is new
to RStudio Projects. I am using the Session 1 course materials.
I have attached CHATGPT_CONTEXT.md and the project README.

Current state: [Describe which file or step is open.]
Relevant files or excerpt: [Attach or paste them.]

Help requested: Explain the project root and the purpose
of the files I supplied. Trace the relative path to
input_data/fafsa_completion.csv. Tie the explanation to
the supplied code. Identify any assumption you need to make.

Verification: Give me one small R Console check, explain
its expected output, and wait for my result.
```

## P2 Inspect a GitHub connection
```text
Goal: Connect my FAFSA practice project to my own private
practice GitHub repository.

Setup: My operating system is [OS]. My Terminal shell is
[PowerShell, Git Bash, zsh or bash]. The .Rproj is open.
My intended practice repository URL is [HTTPS URL].

Current state: [Paste location, git status and repository
root results. Add git remote -v if a repository exists.]

Help requested: Explain my starting state. Give the next
diagnostic step and label where it runs. Use the linked training
procedures. Check the intended repository before suggesting changes.
Keep existing history and working files intact. Do not
include a force push or GitLab transfer in this exercise.

Verification: Explain the expected output. Wait for my
result before choosing the next step.
```

# Prompts for troubleshooting and follow up

## P3 Explain this result
```text
Goal: Complete [specific companion step].
Setup: [Operating system, Terminal shell, project folder.]
Command location: [R Console or Terminal.]
Command I ran: [Exact command.]
Relevant output: [Paste output with sensitive details removed.]
Expected result: [What the guide said should happen.]

Use the Session 1 guide and CHATGPT_CONTEXT.md to explain
the result. Distinguish what the output shows from what
you are inferring. Ask for missing information that changes
the next step. Suggest one diagnostic command, explain it,
and tell me how I will know whether it worked.
```

## P4 Review a proposed command
```text
Goal: Understand this command before running it.
My current step and setup: [Describe them.]
Proposed command: [Paste it.]

Explain each part in plain language. Which folder,
repository or remote will it affect? Does it inspect state
or change it? What must be true first? What output should
I expect? Use the linked training procedures and point out any mismatch.
```

## Follow up questions
- What did you assume about my setup?
- Which supplied file supports that explanation?
- What would show that this is the wrong project or remote?
- How do I verify the result locally and on GitHub?
- Can you explain the next step before giving more commands?

For the next meeting, bring one additional commit or a specific question. Record GitLab access details in the companion. Use the [GitLab transfer procedure](../resources/gitlab-transfer.md) when that exercise begins.
