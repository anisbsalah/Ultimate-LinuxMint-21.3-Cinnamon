#!/bin/bash
#set -e
##################################################################################################################
# Author  :  anisbsalah
# Github  :  https://github.com/anisbsalah
##################################################################################################################
#
# DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
##################################################################################################################
#
# Learn Git with tutorials, news, and tips.
# https://www.atlassian.com/git
#
##################################################################################################################

### Problem solving commands.
### Read before using it.
# https://www.atlassian.com/git/tutorials/undoing-changes/git-reset
# $ git reset --hard orgin/main
# ONLY if you are very sure and no coworkers are on your github.

# Force git to overwrite local files on pull - no merge
# $ git fetch --all
# $ git push --set-upstream origin main
# $ git reset --hard orgin/main

# Update a previous commit comment
# https://www.atlassian.com/git/tutorials/rewriting-history
# https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message
# $ git commit --amend -m "an updated commit message"
# $ git push --force-with-lease origin main
# $ git push --force origin main

# Undo Local Changes That Have Not Been Committed
# To see the affected file listed run:
# $ git status
# To revert a file to the way it was at the previous commit (before your changes) run:
# $ git checkout <file_path>

# Undo a Specific Commit (That Has Been Pushed)
# $ git status # to make sure you have a clean working tree
# To find the hash for the commit you want to undo run:
# $ git log
# Or:
# $ git log --oneline
# Once you know the hash for the commit you want to undo, run the following command ( The --no-edit option prevents git from asking you to enter in a commit message. If you don't add that option, you'll end up in the text editor ):
# $ git revert <SHA> --no-edit
# If working with a remote repo, you can now push those changes:
# $ git push

# Undoing Your Last Commit (That Has Not Been Pushed)
# $ git reset --soft HEAD~
# The same as:
# $ git reset --soft HEAD^
# Add a number to the end to undo multiple commits
# For example, to undo the last 2 commits (assuming both have not been pushed) run:
# $ git reset --soft HEAD~2

# Undoing Local Changes That Have Been Committed (But Not Pushed)
# To make sure you have a clean working tree run:
# $ git status
# To remove the commits, but the changes will appear as uncommitted run:
# $ git reset <SHA>
# To undo the commits and through away the code run:
# $ git reset --hard <SHA>

##################################################################################################################

BOLD='\e[1m'
BLD_OFF='\e[22m'
ITALIC='\e[3m'
ITAL_OFF='\e[23m'
UNDERLINE='\e[4m'
UL_OFF='\e[24m'

# githubdir="$(basename "$(dirname "${PWD}" | tr '[:upper:]' '[:lower:]')")"
project="$(basename "$(pwd)")"

tput setaf 6
printf "######################################################################################################\n"
printf "%b%b%bProject%b: https://github.com/anisbsalah/%s%b%b\n" "$BOLD" "$ITALIC" "$UNDERLINE" "$UL_OFF" "$project" "$BLD_OFF" "$ITAL_OFF"
printf "######################################################################################################\n"
tput sgr0

git remote set-url origin git@github.com:anisbsalah/"${project}".git

##################################################################################################################

### Reset - commit your changes or stash them before you merge
# $ git reset --hard  ( personal alias = grh )

tput setaf 6
echo "######################################################################################################"
echo "Push Code to GitHub"
echo "######################################################################################################"
tput sgr0

### Checking if I have the latest files from github
tput setaf 3
echo "#############################################"
echo "[*] Checking for newer files online first..."
echo "#############################################"
tput sgr0

git pull

### Below command will backup everything inside the project folder
git add --all .

### Give a comment to the commit if you want
tput setaf 5
echo "#############################################"
echo "[#] Write your commit comment!"
echo "#############################################"
tput sgr0

#read -erp "> " input
read -er input

### Committing to the local repository with a message containing the time details and commit text
git commit -m "${input}"

### Push the local files to github
tput setaf 3
echo "#############################################"
echo "[+] Pushing the local files to GitHub..."
echo "#############################################"
tput sgr0

if grep -q main .git/config; then
	echo "Using main"
	git push -u origin main
fi

if grep -q master .git/config; then
	echo "Using master"
	git push -u origin master
fi

tput setaf 2
echo "######################################################################################################"
echo "################# Git Push Done"
echo "######################################################################################################"
tput sgr0
