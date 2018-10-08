#!/bin/bash
for file in *.diff ; do
    /home/guru/beautify-text-corrections/beautify.py "$file" "${file%.*}.msg"
done
