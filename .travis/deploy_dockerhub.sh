#!/bin/sh

docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS$BRANCH" = "master" ]; then
    TAG="latest"

else
    TAG="$TRAVIS$BRANCH"

fi
docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
docker push $TRAVIS_REPO_SLUG
