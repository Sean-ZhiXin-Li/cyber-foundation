# Week2 Day1 - Shell Tools

Date: 2026-05-27

## Objective

Learn basic Linux shell tools and understand how to combine commands using pipelines.

---

## Commands Learned

### grep

**Purpose**

Search for matching text patterns inside files.

**Examples**

```bash
grep ERROR logs.txt
grep INFO logs.txt
grep -i error logs.txt
```

**Engineering Use**

- Search errors in log files
- Find keywords in source code
- Debug CI/CD logs

---

### wc

**Purpose**

Count lines, words, and characters.

**Examples**

```bash
wc -l logs.txt
wc -w logs.txt
wc -c logs.txt
```

**Engineering Use**

- Count dataset records
- Count files
- Measure log size

---

### find

**Purpose**

Search files by conditions.

**Examples**

```bash
find . -name "*.py"
find . -name "*.md"
find . \( -name "*.cpp" -o -name "*.h" \)
```

**Engineering Use**

- Find source files
- Analyze repository structure

---

## Repository Analysis

### THE_NEW

Python files:

```bash
find . -name "*.py" | wc -l
```

Result:

```text
14
```

Markdown files:

```bash
find . -name "*.md" | wc -l
```

Result:

```text
53
```

C++ files:

```bash
find . \( -name "*.cpp" -o -name "*.h" \) | wc -l
```

Result:

```text
17
```

---

## Mistakes

### Path Typo

```bash
cd ./wekk02/day1
```

Correct:

```bash
cd ./week02/day1
```

Lesson:

Path mistakes are common.

### Command Typo

```bash
unqi
```

Correct:

```bash
uniq
```

Lesson:

Read terminal suggestions carefully.

### Shell Syntax Error

Wrong:

```bash
-name "*.h"\)
```

Correct:

```bash
-name "*.h" \)
```

Lesson:

Spaces matter in shell commands.

---

## Most Useful Commands Today

1. find
2. grep
3. wc

---

## Engineering Connection

Today was not about memorizing commands.

The key idea was:

```text
Find Data
    ↓
Filter Data
    ↓
Count Data
    ↓
Analyze Data
```

Using pipelines:

```bash
find ... | grep ... | wc ...
```

This workflow will later be used in:

- Linux Engineering
- GitHub Actions Debugging
- Security Analysis
- Research Projects
- Spacecraft AI Project
