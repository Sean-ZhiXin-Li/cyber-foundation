# Week3 Day2 Summary

## Objective
- Learn advanced Bash scripting: loops, conditional statements, functions, and command substitution
- Automate repetitive tasks such as scanning multiple log files for errors
- Prepare engineering-style documentation for CTF and lab projects

## Commands/Tools Learned
- `for var in list; do ...; done` — loop over files or items
- `if [ condition ]; then ... else ... fi` — conditional branching
- `grep -q <pattern> <file>` — quiet search, returns exit status only
- `grep -c <pattern> <file>` — count matching lines
- `$(command)` — command substitution to store output in variable
- `chmod +x <script.sh>` — make script executable
- `#!/bin/bash` — shebang to specify Bash interpreter

## Analysis / Workflow
1. **Problem:** Check all `.log` files in a directory for lines containing `"ERROR"` and mark them
2. **Plan:**
   - Loop through each file using `for`
   - Count `"ERROR"` occurrences with `grep -c`
   - Use `if` + `-gt 0` to decide whether the file contains errors
   - Print `[FOUND]` or `[CLEAN]` with the count
3. **Implementation:** Write the script in `scan_logs.sh` and make it executable

## Script: scan_logs.sh

```bash
#!/bin/bash
# Script: scan_logs.sh
# Purpose: Scan all .log files in current directory for "ERROR"
#          Count occurrences and mark files with FOUND / CLEAN

for file in *.log; do
    count=$(grep -c "ERROR" "$file")
    if [ "$count" -gt 0 ]; then
        echo "[FOUND] $file : $count errors"
    else
        echo "[CLEAN] $file : $count errors"
    fi
done
```

## Results
Running the script in `bash_practice/day2` produced:

```
[CLEAN] app1.log : 0 errors
[FOUND] app2.log : 1 errors
```

- `[FOUND]` indicates files containing at least one `"ERROR"`
- `[CLEAN]` indicates no matches

## Mistakes / Lessons
- Ensure you are in the correct directory; `*.log` only matches files in the current directory
- `grep -q` is used for conditional checks without printing output
- `-gt` is required for numeric comparison in `if` statements; `>` would be interpreted as redirection

## Engineering Connection
- Automates repetitive log analysis tasks in CTF and lab projects
- Can be expanded to handle multiple patterns, directories, or generate summary reports
- Using loops, conditionals, and command substitution is the foundation for robust Bash scripts in real projects
