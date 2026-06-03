# Week2 Day6 - Bandit Levels 8-10

Date: 2026-06-02

## Objective

Practice extracting useful information from duplicated, binary-like, and encoded data.

This day focused on:

* sort
* uniq
* strings
* grep
* base64
* data transformation
* information extraction

---

## Level 8

### Goal

Find the line that appears only once.

### Analysis

The file contained many duplicate lines.

The challenge was not to manually inspect the file.

Instead, the data needed to be transformed before filtering.

### Initial Mistake

Tried:

```bash
uniq data.txt
```

Problem:

```text
uniq only compares adjacent lines.
```

If duplicate lines are not next to each other, uniq cannot correctly identify unique entries.

### Solution

First sort the data:

```bash
sort data.txt
```

Then filter unique lines:

```bash
sort data.txt | uniq -u
```

### Why It Works

Process:

```text
Unsorted Data
↓
sort
↓
Duplicate Lines Become Adjacent
↓
uniq -u
↓
Unique Line
```

### Lesson

Data often requires transformation before useful filtering can occur.

### Security Lesson

Duplicate information can hide important entries.

Sorting and filtering can reveal anomalies quickly.

---

## Level 9

### Goal

Find the password hidden inside a file containing unreadable data.

### Analysis

The file could not be interpreted as normal text.

The challenge required extracting human-readable strings.

### Solution

Extract readable text:

```bash
strings data.txt
```

Then search for the provided marker:

```bash
strings data.txt | grep ===
```

### Why It Works

Process:

```text
Binary-like Data
↓
strings
↓
Readable Text
↓
grep
↓
Target Information
```

### Lesson

Useful information may exist inside files that appear unreadable.

### Security Lesson

Sensitive information can often be recovered from binary files if readable strings remain embedded.

---

## Level 10

### Goal

Decode a Base64-encoded password.

### Analysis

The file content was encoded rather than encrypted.

The task was to recover the original text.

### Solution

Decode using:

```bash
base64 -d data.txt
```

### Why It Works

Process:

```text
Encoded Text
↓
Decode
↓
Original Text
```

### Important Concept

Base64 is:

```text
Encoding
```

not:

```text
Encryption
```

Encoding changes representation.

Encryption requires a key.

### Lesson

Before analyzing data, determine whether it is encoded, compressed, or encrypted.

### Security Lesson

Encoded information is not secure information.

Anyone with the correct decoding method can recover the original content.

---

## Important Concepts Learned

### Data Transformation

Raw data is often not immediately useful.

It may need to be:

* sorted
* decoded
* filtered
* extracted

before analysis becomes possible.

---

### Command Composition

Multiple commands can be combined:

```bash
sort data.txt | uniq -u

strings data.txt | grep ===
```

Process:

```text
Transform
↓
Filter
↓
Result
```

This is more powerful than using commands individually.

---

## Biggest Lesson

All three levels followed the same pattern:

```text
Raw Data
↓
Transform
↓
Filter
↓
Useful Information
```

Examples:

```text
Duplicate Data
↓
sort
↓
uniq -u
```

```text
Unreadable Data
↓
strings
↓
grep
```

```text
Encoded Data
↓
base64 -d
↓
Original Data
```

The key skill is not memorizing commands.

The key skill is understanding what transformation is needed before information can be extracted.

---

## Engineering Connection

Bandit 8-10 trained the ability to:

* analyze structured data
* identify anomalies
* extract information from noisy files
* decode encoded content
* compose commands into workflows

These same skills apply to:

* Linux engineering
* security investigations
* log analysis
* debugging workflows
* AI experiment inspection
* research data processing

Core idea:

```text
Problem
↓
Data Property
↓
Transformation
↓
Filter
↓
Information
```
