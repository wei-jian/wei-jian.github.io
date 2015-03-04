#!/bin/bash

# Temporarily store uncommited changes
git stash

# Verify correct branch
git checkout develop

# Build new files
stack build
stack exec site clean
stack exec site build

# Get previous files
git fetch --all
git checkout master

# Overwrite existing files with new files
rsync -a --filter='P _site/'      \
         --filter='P _cache/'     \
         --filter='P .git/'       \
         --filter='P .gitignore'  \
         --filter='P .stack-work' \
         --delete-excluded        \
         _site/ .

# Commit
git add -A
git commit -m "Publish (`date`)"

# Push
git push origin master:master

# Restoration
git checkout develop
git stash pop
