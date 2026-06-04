# Week3 Day1 Summary

## Objective
- Learn Git branch management, merging, conflict resolution, and tagging
- Establish an engineering-oriented version control workflow for CTF and lab projects

## Commands/Tools Learned
- `git branch <name>`: Create a new branch
- `git checkout <branch>`: Switch to a branch
- `git add <file>` + `git commit -m "<msg>"`: Stage and commit changes
- `git merge <branch>`: Merge a branch into the current branch
- `git tag -a <tag> -m "<msg>"`: Create a tag
- `git push origin <tag>`: Push the tag to the remote repository

## Analysis / Workflow
1. Create a feature branch to isolate experimental changes
2. Commit changes to the local feature branch
3. Switch back to the main branch and merge changes
4. Resolve conflicts manually if they occur (none occurred today)
5. Tag the current stable version for future reference

## Results
- File `week03_day1_git.md` created and committed
- Branch `feature_day1` successfully merged into `main`
- Tag `v1.0` created and pushed to the remote repository

## Mistakes / Lessons
- Pay attention to quoting in `echo`; an unmatched quote caused a command error initially
- Fast-forward merges do not generate conflicts, but in real projects conflicts may occur, so practicing manual conflict resolution is essential

## Engineering Connection
- Branches isolate experiments from the main workflow in CTF projects or lab notebooks
- Tags mark milestones, e.g., completion of Day1 exercises
- Clear and concise commit messages enable easy tracking and collaboration