#!/bin/bash

count=$(find . -name "*.txt" | wc -l)

echo $count
