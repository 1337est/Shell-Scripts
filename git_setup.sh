#!/bin/bash

#  Git setup
git config --global user.name "1337est"
git config --global user.email "59178218+1337est@users.noreply.github.com"
echo "Git config for user.name:"
git config --global user.name
echo "Git config for user.email:"
git config --global user.email

echo "Setting up github with 'gh auth login':"
gh auth login

echo "script completed"
