# Application Modernization Workshop using Claude-Flow

## Prerequisites
The following materials will be needed for you to participate in the workshop. If you do not have these materials, you're welcome to watch as a demo.

* A GitHub account capable of running GitHub Codespaces
* A Claude account capable of running Claude Code at the Pro or Max levels

The reason for Codespaces is to have a common denominator for a runtime environment.  This makes it easier to manage issues during the workshop. That said, if you have a working installation of Claude Code, feel free to use it. You will need to clone the repository and pickup the instructions at the step where we allow claude permissions.

## Installation steps

> Step 1: Fork this repository

Fork this [GitHub repository](https://github.com/AsperitasConsulting/claude-flow-modernization-workshop) so that you can best run it as a codespace in your own account.

![Repository fork instructions](images/codespace-repo-fork.png)


> Step 2: Create your GitHub Codespace
Create and start your own Codespace. These instructions guide you through using your codespace from a browser. While these instructions don't use the GitHub CLI, that is an option if you prefer.

![Codespace create instructions](images/create-codespace-1.png)

Note that the default of 2 cores is a little underpowered for Claude-Flow. While it will work, things take a bit longer.

Also, use the ```main``` branch.  I'm using a feature branch in the picture as I was still writing these instructions.

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

As a response to this command, you'll be asked to login to Claude code. You need a "Pro" or "Max" plan for this workshop. Choosing the "Claude Account with Subscription" option is recommended as it allows the Claude Code GUI to be used. I find this more useful if my team wants to communicate with me. You can use an API key, but then you need to use a headless mode that spits out unreadable JSON-formatted data to you. With that format, it's much harder for the team to communcate with you.

![Codespace create instructions](images/claude-code-install.png)

You will be prompted to log into Claude. I usually have better luck copying the URL and posting it in a separate tab. 

![Codespace create instructions](images/claude-code-install-2.png)

Claude will ask you to confirm the recommended terminatl display settings.

![Codespace create instructions](images/claude-code-install-3.png)

Claude will ask you to re-confirm the option to skip permissions.  It's in your best interest to do so at this point, despite the ominous warning.

![Codespace create instructions](images/claude-code-install-4.png)

You'll need to exit the Claude Code UI by using Cntl-C

> Step 5: Configure Claude Code

This next step installs Claude-Flow.  You "may" need to hit the carriage return a couple of times if the display freezes.

```
npx claude-flow@alpha init --force
```

## Workshop Commands

> 12 Factor Analysis instructions

* Perform a twelve-factor analysis on this application in folder git/idempiere-2025-11-08 and put the results in folder 12-factor.
* Twelve-factor principles are documented at https://www.12factor.net/  
* I want to know where this application falls short of twelve-factor principles so that I can assess it's ability to capitalize on public cloud dynamic scaling and availability features should it be deployed there. 
* Do not change the application yet. 
* I'm only interested in the twelve-factor analysis. 
* Please let me know if you need additional information.

```
npx claude-flow@alpha swarm "Perform a twelve-factor analysis on this application in folder git/idempiere-2025-11-08 and put the results in folder 12-factor. Twelve-factor principles are documented at https://www.12factor.net/  I want to know where this application falls short of twelve-factor principles so that I can assess it's ability to capitalize on public cloud dynamic scaling and availability features should it be deployed there. Do not change the application yet. I'm only interested in the twelve-factor analysis. Please let me know if you need additional information." --claude
```


> 12 Factor Analysis implementation plan

* Use the twelve-factor analysis you documented in folder 12-factor as input. 
* Twelve-factor principles are documented at https://www.12factor.net/  
* Document an implementation plan to upgrade the application in folder git/idempiere-2025-11-08 to adhere to 12-factor principles. 
* Place the implementation plan in folder 12-factor-plans. 
* Assume the implementation will be performed by agentic engineers using Claude-Flow and Claude Code.  
* Do not change the application yet. Please let me know if you need additional information.

```
npx claude-flow@alpha swarm "Use the twelve-factor analysis you documented in folder 12-factor as input. Twelve-factor principles are documented at https://www.12factor.net/  Document an implementation plan to upgrade the application in folder git/idempiere-2025-11-08 to adhere to 12-factor principles. Place the implementation plan in folder 12-factor-plans. Assume the implementation will be performed by agentic engineers using Claude-Flow and Claude Code.  Do not change the application yet. Please let me know if you need additional information." --claude
```

> 12 Factor Analysis implementation plan refinement

* Refine the plan you documented in folder 12-factor-plans. 
* Please enhance the plan to ensure that an automated test harness exists before we change anything in the application.
* Source code for the application in folder git/idempiere-2025-11-08.
* Please reflect human activity by agentic engineers and other humans needed. 
* Also include any needed human effort and staffing needs. 
* Please let me know if you need additional information.
```
npx claude-flow@alpha swarm "Refine the plan you documented in folder 12-factor-plans. Please enhance the plan to ensure that an automated test harness exists before we change anything in the application. Source code for the application in folder git/idempiere-2025-11-08. Please reflect human activity by agentic engineers and other humans needed. Also include any needed human effort and staffing needs. Please let me know if you need additional information." --claude
```

> Product Migration analysis instruction

* My intention is to replace an installation of the idempiere product at an enterprise with a SaaS product alternative. 
* Source code for the application in folder git/idempiere-2025-11-08.
* Do a market analysis to determine which SaaS products would be the best candidates for migration. 
* Place the analysis in folder saas-market-analysis. 
* Product selection will be based on preserving end-user capabilities to the extent possible and an estimate of the migration effort. 
* Please let me know if you need additional information.

```
npx claude-flow@alpha swarm "My intention is to replace an installation of the idempiere product at an enterprise with a SaaS product alternative. Source code for the application in folder git/idempiere-2025-11-08. Do a market analysis to determine which SaaS products would be the best candidates for migration. Place the analysis in folder saas-market-analysis. Product selection will be based on preserving end-user capabilities to the extent possible and an estimate of the migration effort. Please let me know if you need additional information." --claude
```