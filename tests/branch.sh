#!/bin/bash

test_count=$(cat branches.yml | yq '.tests | length')

# get the regex from the github workflow file
# bash extended regex slightly different, remove the leading and trailing /, but without removing the / after the type
# this will work with 99% of branch regexes, but there could be subtle changes to monkey with
test_regex=$( cat ../.github/workflows/git-standards.yml | yq '.jobs.validate-git-standards.steps[2].with.allowed' |  sed -e 's/^\///g' | sed -e 's/\/$//g')

printf '%-25s %-45s %s\n' "NAME" "TEST VALUE" "RESULT"
printf '%-25s %-45s %s\n' "----" "----------" "------"

for(( i=0; i < $test_count; i++))
do
    test_name=$(yq ".tests[$i].name" branches.yml)
    test_value=$(yq ".tests[$i].value" branches.yml)

    printf '%-25s %-45s' "$test_name" "$test_value"
    if [[ $test_value =~ $test_regex ]]
    then
        echo " SUCCESS"
    else
        echo " FAIL"
    fi
done