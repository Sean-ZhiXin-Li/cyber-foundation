# Week2 Day2 - Bash Scripting Basics

Date: 2026-05-28

## Objective

Learn the fundamentals of Bash scripting and understand how Linux automation works.

This day focused on:

* Executable scripts
* Shebang (`#!/bin/bash`)
* Variables
* For loops
* If statements
* Exit codes
* Basic automation

---

## Concepts Learned

### Shebang

Example:

```bash
#!/bin/bash
```

Purpose:

Tell Linux which interpreter should execute the script.

Meaning:

```text
This file should be executed by Bash.
```

When running:

```bash
./hello.sh
```

Linux reads the first line and automatically launches Bash.

---

### Executable Permission

Before:

```bash
-rw-r--r--
```

After:

```bash
chmod +x hello.sh
```

Permission becomes:

```bash
-rwxr-xr-x
```

Meaning:

The script can now be executed directly.

Example:

```bash
./hello.sh
```

---

### Variables

Example:

```bash
name="Sean"

echo $name
```

Output:

```text
Sean
```

Key Idea:

```text
name="Sean"
```

creates a variable.

```text
$name
```

retrieves the value stored in the variable.

Comparison with C++:

```cpp
string name = "Sean";
cout << name;
```

---

### Command Substitution

Example:

```bash
count=$(find . -name "*.txt" | wc -l)
```

Meaning:

Run a command and store its output in a variable.

Equivalent idea:

```text
Execute command
↓
Capture output
↓
Save into variable
```

---

### For Loop

Example:

```bash
for file in *.txt
do
    echo $file
done
```

Purpose:

Iterate through multiple files automatically.

Comparison with Python:

```python
for file in files:
    print(file)
```

---

### If Statement

Example:

```bash
if [ -f hello.sh ]
then
    echo "Found"
else
    echo "Not Found"
fi
```

Purpose:

Execute different actions depending on a condition.

---

### Exit Code

Check exit status:

```bash
echo $?
```

Meaning:

Display the exit code of the previous command.

Examples:

Successful command:

```bash
ls
echo $?
```

Output:

```text
0
```

Failed command:

```bash
ls does_not_exist
echo $?
```

Output:

```text
2
```

Key Rule:

```text
0     = success
non-0 = failure
```

This concept is heavily used in:

* Bash scripts
* GitHub Actions
* CI/CD systems
* Automation pipelines

---

## Scripts Created

### hello.sh

```bash
#!/bin/bash

echo "Hello Linux"
```

Purpose:

First executable Bash script.

---

### variable.sh

```bash
#!/bin/bash

name="Sean"

echo $name
```

Purpose:

Practice variables.

---

### list_txt.sh

```bash
#!/bin/bash

for file in *.txt
do
    echo $file
done
```

Purpose:

Practice loops.

---

### count_txt.sh

```bash
#!/bin/bash

count=$(find . -name "*.txt" | wc -l)

echo $count
```

Purpose:

Practice command substitution.

---

### check_file.sh

```bash
#!/bin/bash

if [ -f hello.sh ]
then
    echo "Found"
else
    echo "Not Found"
fi
```

Purpose:

Practice conditional logic.

---

### report.sh

```bash
#!/bin/bash

echo "Python files:"
find . -name "*.py" | wc -l

echo "Markdown files:"
find . -name "*.md" | wc -l

echo "Text files:"
find . -name "*.txt" | wc -l
```

Purpose:

Generate a simple repository report.

---

## Biggest Lessons

### Lesson 1

Linux commands can be automated through scripts.

Instead of running commands manually every day, scripts can perform repetitive work automatically.

---

### Lesson 2

Variables and command substitution make scripts dynamic.

Scripts can collect information and react to results.

---

### Lesson 3

Exit codes are the foundation of automation.

Computers determine success or failure through exit codes rather than reading human-readable messages.

---

## Most Useful Concepts Today

1. `#!/bin/bash`
2. `$variable`
3. `$(command)`
4. `for`
5. `if`
6. `echo $?`

---

## Engineering Connection

Today marked the transition from:

```text
Running commands manually
```

to:

```text
Automating commands with scripts
```

This foundation will later support:

* Linux engineering workflows
* GitHub Actions
* Continuous Integration (CI)
* Security automation
* Data processing
* Spacecraft AI project tooling

The core idea is:

```text
Command
    ↓
Script
    ↓
Automation
    ↓
Engineering System
```
