#!/usr/bin/env bash

find ~/Dev/GitHub -name ".git" | while read repo
do
    DIR=$(dirname "$repo")

    echo
    echo "Updating $(basename "$DIR")"

    git -C "$DIR" pull --ff-only || true
done
