# Application Modernization Workshop using Claude-Flow

## Installation steps

> Step 1: Fork this repository
Fork this GitHub repository so that you can best run it as a codespace in your own account.

![Repository fork instructions](images/codespace-repo-fork.png)


> Step 2: Create your GitHub Codespace
Create and start your own Codespace. These instructions guide you through using your codespace from a browser. While these instructions don't use the GitHub CLI, that is an option if you prefer.

![Codespace create instructions](images/create-codespace-1.png)

Note that the default of 2 cores is a little underpowered for Claude-Flow. While it will work, things take a bit longer.

Also, use the ```main``` branch.  I'm using a feature branch as I'm still writing these instructions.

![Codespace create instructions](images/create-codespace-2.png)


> Step 3: Install Claude Code in your workspace
Execute the command below in the Terminal window of your Codespace. Claude Code will prompt you for a log in. Follow instructions for a 

```
curl -fsSL https://claude.ai/install.sh | bash
```

> Step 4: Configure Claude Code
We accept Claude-Flow's instructions on permissions requirements.

```
claude --dangerously-skip-permissions
```

> Step 5: Configure Claude Code
```
npm install -g claude-flow@latest
claude-flow --version
```
