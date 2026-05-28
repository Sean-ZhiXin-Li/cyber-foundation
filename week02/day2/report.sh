#!/bin/bash

echo "Python files: "
find . -name "*.py" | wc -l

echo "Markdown files: "
find . -name "*.md" | wc -l

echo "Text files: "
find . -name "*.txt" | wc -l

