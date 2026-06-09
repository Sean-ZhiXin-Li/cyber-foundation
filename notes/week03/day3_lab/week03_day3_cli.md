# Week3 Day3 Summary

## Objective

- Learn the Linux command-line environment and text processing workflow
- Understand how to extract, filter, modify, and analyze structured text data
- Master the core Unix text-processing tools: `cut`, `sort`, `uniq`, `awk`, and `sed`
- Build a foundation for CTF challenges, log analysis, and cybersecurity automation

---

# Commands / Tools Learned

## cut

Extract specific fields from structured text.

```bash
cut -d ' ' -f4 access.log
```

### Options

- `-d` : delimiter (field separator)
- `-f` : field number

Example:

```text
2026-06-08 10:02:14 ERROR 192.168.1.8 POST /login 403
```

Fields:

| Field | Value |
|--------|-------|
| $1 | Date |
| $2 | Time |
| $3 | Level |
| $4 | IP Address |
| $5 | Method |
| $6 | Path |
| $7 | Status Code |

---

## sort

Sort text.

```bash
sort file.txt
```

### Common Options

```bash
sort -n
```

Sort numerically.

```bash
sort -r
```

Reverse order.

```bash
sort -nr
```

Sort numerically in descending order.

---

## uniq

Remove duplicate adjacent lines.

```bash
uniq
```

Count duplicate lines.

```bash
uniq -c
```

Usually combined with `sort`.

Example:

```bash
cut -d ' ' -f4 access.log | sort | uniq -c
```

Output:

```text
2 192.168.1.5
2 192.168.1.8
1 192.168.1.9
1 192.168.1.10
```

---

## awk

A powerful text-processing language.

Named after its creators:

- Alfred Aho
- Peter Weinberger
- Brian Kernighan

### Filter lines

```bash
awk '$3=="ERROR"' access.log
```

Output:

```text
2026-06-08 10:02:14 ERROR 192.168.1.8 POST /login 403
2026-06-08 10:05:45 ERROR 192.168.1.8 POST /login 403
```

---

### Extract fields

```bash
awk '$3=="ERROR"{print $4}' access.log
```

Output:

```text
192.168.1.8
192.168.1.8
```

---

### Count matching lines

```bash
awk '$3=="ERROR"{count++} END{print count}' access.log
```

Output

```text
2
```

---

## sed

Stream Editor

Used to edit text streams.

### Replace text

```bash
sed 's/ERROR/ALERT/g' access.log
```

- `s` → substitute
- `g` → global (replace every match on each line)

The original file remains unchanged.

---

### Modify file in place

```bash
sed -i 's/ERROR/ALERT/g' access.log
```

`-i`

means

```text
in-place
```

The original file is modified directly.

---

## Pipeline

Linux commands become much more powerful when connected together.

Example:

```bash
sed 's/INFO/NOTICE/g' access.log | awk '$3=="NOTICE"{print $4}'
```

Workflow

```text
access.log
      │
      ▼
sed
Replace INFO → NOTICE
      │
      ▼
awk
Filter NOTICE
      │
      ▼
Print IP Address
```

---

# Analysis / Workflow

Today's workflow focused on processing structured log files.

```text
Raw Log File
      │
      ▼
Extract Fields (cut)
      │
      ▼
Sort Results (sort)
      │
      ▼
Count Occurrences (uniq -c)
      │
      ▼
Filter Specific Records (awk)
      │
      ▼
Modify Text (sed)
      │
      ▼
Combine Commands Using Pipelines
```

---

# Results

Successfully completed:

- Extracted log levels
- Extracted IP addresses
- Counted repeated IP addresses
- Sorted results by occurrence frequency
- Filtered ERROR entries
- Counted ERROR messages
- Replaced log levels using sed
- Combined sed and awk through pipelines

Example:

```bash
cut -d ' ' -f4 access.log \
| sort \
| uniq -c \
| sort -nr
```

Output:

```text
2 192.168.1.8
2 192.168.1.5
1 192.168.1.9
1 192.168.1.10
```

---

# Mistakes / Lessons

## cut vs awk

`cut`

- Extracts fields only
- Fast and simple
- Cannot filter based on field values

`awk`

- Filters records
- Extracts fields
- Counts values
- Performs calculations
- Supports variables and programming logic

---

## sed vs awk

`sed`

Focuses on

```text
Modify Text
```

`awk`

Focuses on

```text
Analyze Data
```

---

## Why Pipelines Matter

Each Unix tool performs one task well.

Pipelines allow multiple tools to work together.

```text
Command A
      │
      ▼
Command B
      │
      ▼
Command C
      │
      ▼
Final Result
```

This follows the Unix philosophy:

> Do one thing, and do it well.

---

# Engineering Connection

These tools are widely used in:

- Linux system administration
- Log analysis
- Security monitoring
- Digital forensics
- CTF challenges
- Bug bounty reconnaissance
- Malware analysis
- Automation scripting
- Research data processing

Instead of writing a complete program, Unix engineers often solve problems by combining small command-line tools into efficient processing pipelines.

This workflow is fundamental to cybersecurity and Linux engineering.
