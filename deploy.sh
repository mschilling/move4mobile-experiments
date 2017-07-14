#!/bin/bash
echo "Executing deploy script..."
if [ -z "$1" ]; then
    echo "No alias/project id supplied as argument..."
    echo "Exiting."
    exit 1
fi
echo "Branch: $TRAVIS_BRANCH"
if [ $TRAVIS_BRANCH == "feature/TravisSetup" ]; then
    echo "Branch is feature/TravisSetup..."
    echo "Checking on PR..."
    echo "Pull Request: $TRAVIS_PULL_REQUEST"
    if [ $TRAVIS_PULL_REQUEST == false ]; then
        echo "Initiate deployment :)"
        firebase use $1 --token "${FIREBASE_API_TOKEN}"
        firebase deploy --token "${FIREBASE_API_TOKEN}" --non-interactive
    else
        echo "Is a pull request..."
        echo "Not deploying."
    fi
else
    echo "Not develop branch..."
    echo "Not deploying."
fi
