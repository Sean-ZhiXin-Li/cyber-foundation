# Week3 Day4 Summary

## Objective

- Complete Bandit Levels 11–15
- Learn evidence-based file analysis using Linux tools
- Understand SSH public-key authentication
- Learn the fundamentals of TCP and TLS communication
- Apply Unix pipelines and command-line tools to real CTF challenges

---

# Commands / Tools Learned

## tr

Translate characters.

```bash
tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

Used to decode ROT13-encoded text.

---

## xxd

Convert between hexadecimal dumps and binary files.

```bash
xxd -r data.txt data
```

Option:

- `-r` : reverse (convert hex dump back to binary)

---

## file

Identify the real file type.

```bash
file data
```

Unlike Windows, Linux identifies files using **magic numbers** rather than file extensions.

---

## gzip / gunzip

Compress and decompress gzip files.

```bash
gunzip data.gz
```

---

## bzip2 / bunzip2

Compress and decompress bzip2 files.

```bash
bunzip2 data.bz2
```

---

## tar

Archive multiple files.

Extract files from a tar archive.

```bash
tar -xf archive.tar
```

Options:

- `-x` : extract
- `-f` : specify archive file

---

## ssh

Secure Shell.

Login to a remote Linux machine.

```bash
ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
```

Options:

- `-i` : identity (private key)
- `-p` : port

---

## chmod

Modify file permissions.

```bash
chmod 600 sshkey.private
```

Permission:

```text
Owner : Read + Write
Group : None
Others: None
```

SSH requires private keys to be readable only by the owner.

---

## nc (Netcat)

TCP client.

```bash
nc localhost 30000
```

Used to establish a TCP connection and send the current password to the server.

---

## openssl s_client

TLS client.

```bash
openssl s_client -connect localhost:30001
```

Used to establish an encrypted TLS connection.

---

# Analysis / Workflow

## Bandit 11

```text
ROT13 Text
      │
      ▼
tr
      │
      ▼
Decoded Password
```

---

## Bandit 12

Evidence-Based File Analysis

```text
Hex Dump
      │
      ▼
xxd -r
      │
      ▼
Binary File
      │
      ▼
file
      │
      ▼
Identify File Type
      │
      ▼
Choose Correct Tool
      │
      ▼
Extract
      │
      ▼
Repeat
```

The extraction chain included:

```text
Hex Dump
    ↓
gzip
    ↓
bzip2
    ↓
gzip
    ↓
tar
    ↓
bzip2
    ↓
tar
    ↓
gzip
    ↓
ASCII Text
```

The password was only obtained after every layer had been correctly identified and extracted.

---

## Bandit 13

SSH Public-Key Authentication

```text
Private Key
      │
      ▼
SSH Authentication
      │
      ▼
bandit14 Login
```

Unlike password authentication, SSH verifies identity using a private/public key pair.

---

## Bandit 14

TCP Communication

```text
Password
      │
      ▼
nc
      │
      ▼
TCP Connection
      │
      ▼
Server Verification
      │
      ▼
Next Password
```

---

## Bandit 15

TLS Communication

```text
Password
      │
      ▼
OpenSSL
      │
      ▼
TLS Handshake
      │
      ▼
Encrypted TCP Channel
      │
      ▼
Server Verification
      │
      ▼
Next Password
```

---

# Results

Successfully completed:

- Bandit 11
- Bandit 12
- Bandit 13
- Bandit 14
- Bandit 15

Learned:

- ROT13 decoding
- Binary recovery
- Nested archive extraction
- File identification using magic numbers
- SSH private-key authentication
- TCP communication using Netcat
- TLS communication using OpenSSL

---

# Mistakes / Lessons

## File Extensions Cannot Be Trusted

File names may be misleading.

Always verify file types using:

```bash
file filename
```

---

## Evidence Before Action

Instead of guessing,

```text
Try gzip
Try tar
Try unzip
```

use

```text
Unknown File
      │
      ▼
file
      │
      ▼
Identify
      │
      ▼
Choose Tool
```

This is the standard workflow used in digital forensics.

---

## TCP vs TLS

TCP

```text
Plain Communication
```

TLS

```text
Encrypted Communication
```

HTTPS is built on top of TLS.

---

## Private Key Security

SSH refuses to use private keys with overly permissive permissions.

```bash
chmod 600 sshkey.private
```

is required before authentication.

---

# Engineering Connection

This week's exercises introduced several core concepts used in cybersecurity:

- Digital forensics
- Evidence-based file analysis
- Archive extraction
- SSH authentication
- TCP networking
- TLS encryption
- Unix pipelines
- Linux command-line engineering

Rather than relying on trial and error, modern Linux engineering follows an evidence-driven workflow:

```text
Observe
      │
      ▼
Identify
      │
      ▼
Analyze
      │
      ▼
Choose the Correct Tool
      │
      ▼
Verify
```

This methodology is widely used in CTF competitions, penetration testing, digital forensics, malware analysis, and real-world cybersecurity engineering.
