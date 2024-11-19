#!/bin/bash

test_count=$(cat commits.yml | yq '.tests | length')

for(( i=0; i < $test_count; i++))
do
    test_name=$(yq ".tests[$i].name" commits.yml)
    test_value=$(yq ".tests[$i].value" commits.yml)

    echo "-- TEST NAME -------------------------------------------------------------------"
    echo
    echo "$test_name"
    echo
    echo "-- TEST COMMIT MEASSAGE --------------------------------------------------------"
    echo
    echo "$test_value"
    echo
    echo "-- COMMITLINT OUTPUT -----------------------------------------------------------"
    echo "$test_value" | commitlint -g ../.commitlintrc.yml
    echo "********************************************************************************"
    echo
done