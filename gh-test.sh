#!/bin/sh

# This script will perform a full PR workflow on this repository. It will update
# the changes-a-lot.txt file and then do a branch, pr, and merge. It will
# pause for you too look at the github actions page.

the_serial=$(date +%s)
the_date=`date`

# What type of change?
# 
# https://www.npmjs.com/package/conventional-changelog-eslint
MY_TYP="fix"
MY_TYP_l=$(echo $MY_TYP | tr [:upper:] [:lower:] )

# an optional prefix to add to all messaging
MY_PREFIX="jira-1234"

# branch name
MY_BRANCH="$MY_TYP_l/$MY_PREFIX-$the_serial"

# commit message
MY_CMSG="$MY_TYP: $MY_PREFIX commit message for $the_serial"

# PR title
MY_TITLE="$MY_TYP_l: $MY_PREFIX title for $the_serial"

#PR body
MY_BODY="Hello world. Body for branch $MY_BRANCH."

set | grep MY_

# echo
# echo
# echo "-----------------------------------------------------------------------------"
# echo "Check your strings.                                                        --"
# echo "Then, press ENTER if happy, else CTL+C.                                    --"
# echo "-----------------------------------------------------------------------------"
# read


git checkout -b "$MY_BRANCH"

# This is the first commit using a conventional commit message
date > changes-a-lot.txt
git add --verbose .
git commit --message "$MY_CMSG"

# these are some intermediate commits to show squash merging and semantic release
for ((i=1;i<=3;i++))
do
    date > changes-a-lot.txt && git add --verbose . && git commit --message "non-conventional commit $i"
done

#git push origin
git push --set-upstream origin $MY_BRANCH

gh pr create --title "$MY_TITLE" --body="$MY_BODY" 


echo
echo
echo "-----------------------------------------------------------------------------"
echo "Branch rules checks.                                                       --"
echo "Then, press ENTER  .                                                       --"
echo "-----------------------------------------------------------------------------"

read 

gh pr merge "$MY_BRANCH" -s -d


# echo
# echo
# echo "-----------------------------------------------------------------------------"
# echo "Go watch the DEV Terraform CI/CD Cleanup and PROD Terraform CI/CD Pipeline --"
# echo "jobs run in GH actions. Then go check AWS for the new SSM parameters       --"
# echo "Then, press ENTER.                                                       --"
# echo "-----------------------------------------------------------------------------"

# read

# echo
# echo
git pull

