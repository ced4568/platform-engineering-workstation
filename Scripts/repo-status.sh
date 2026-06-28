#!/usr/bin/env bash

find ~/Dev/GitHub -name ".git" | while read repo
do
    DIR=$(dirname "$repo")

    echo
    echo "======================================="
    echo "$DIR"
    echo "======================================="

    git -C "$DIR" status --short --branch
done
