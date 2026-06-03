# Week2 Day5 - Bandit Levels 5-7

Date: 2026-05-31

## Objective

Practice translating problem conditions into Linux command filters and locating information efficiently using command-line tools.

This day focused on:

* find
* grep
* file ownership
* file size filtering
* absolute vs relative paths
* stderr redirection

---

## Level 5

### Goal

Find the password stored in a file with the following properties:

* human-readable
* 1033 bytes
* not executable

### Analysis

The challenge was not to search manually.

Instead, the file properties were translated into Linux filters.

Conditions:

```text
regular file
1033 bytes
not executable
```

Translated into:

```bash
find . -type f -size 1033c ! -executable
```

Result:

```text
./maybehere07/.file2
```

Read the file:

```bash
cat ./maybehere07/.file2
```

Password successfully recovered.

### Security Lesson

File metadata can be used to locate sensitive information without knowing the file name.

---

## Level 6

### Goal

Find a file that is:

* owned by user bandit7
* owned by group bandit6
* exactly 33 bytes

### Analysis

Conditions:

```text
owner = bandit7
group = bandit6
size = 33 bytes
```

Translated into:

```bash
find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null
```

Result:

```text
/var/lib/dpkg/info/bandit7.password
```

Read the file:

```bash
cat /var/lib/dpkg/info/bandit7.password
```

### Mistake

Initially used:

```bash
cat ./var/lib/dpkg/info/bandit7.password
```

Error:

```text
No such file or directory
```

Reason:

The file path returned by find was an absolute path:

```text
/var/lib/dpkg/info/bandit7.password
```

Adding `./` incorrectly converted it into a relative path.

### Lesson

Understand the difference between:

```text
Absolute Path
```

Example:

```bash
/var/log/syslog
```

and

```text
Relative Path
```

Example:

```bash
./notes.txt
```

### Security Lesson

Linux file ownership and group information can be powerful filters when searching large systems.

---

## Level 7

### Goal

Find the password stored next to the word:

```text
millionth
```

### Analysis

The keyword provided by the problem became the search filter.

Command:

```bash
grep millionth data.txt
```

Result:

```text
millionth       dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
```

The password was located immediately.

### Why grep Works

grep scans a file line by line.

When a line contains the search keyword, grep prints the entire matching line.

Concept:

```text
Scan line
↓
Match keyword
↓
Print line
```

### Security Lesson

Keyword searching is one of the fastest ways to locate useful information in logs, configuration files, and large datasets.

---

## Important Concepts Learned

### stderr Redirection

Command:

```bash
2>/dev/null
```

Meaning:

```text
Redirect error output to the null device.
```

Purpose:

Hide permission-denied messages while searching the entire system.

Example:

```bash
find / -type f 2>/dev/null
```

### Absolute vs Relative Paths

Absolute path:

```bash
/var/lib/dpkg/info/file.txt
```

Relative path:

```bash
./file.txt
```

Understanding the difference prevents many common Linux mistakes.

---

## Biggest Lesson

Every Bandit challenge followed the same pattern:

```text
Problem
↓
Conditions
↓
Linux Filters
↓
Answer
```

Examples:

```text
1033 bytes
↓
-size 1033c
```

```text
owned by bandit7
↓
-user bandit7
```

```text
contains keyword millionth
↓
grep millionth
```

The key skill is not memorizing commands.

The key skill is translating problem statements into command filters.

---

## Engineering Connection

Bandit 5-7 trained the ability to:

* search large file systems efficiently
* locate files using metadata
* filter information using ownership and size
* suppress irrelevant errors
* extract useful information from text

These same skills apply to:

* Linux engineering
* log debugging
* security investigations
* repository analysis
* research workflows
* AI project maintenance

Core idea:

```text
Problem
↓
Conditions
↓
Filters
↓
Information
```

