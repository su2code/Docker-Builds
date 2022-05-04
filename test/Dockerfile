ARG BASE_IMAGE=su2code/build-su2:latest

FROM $BASE_IMAGE

LABEL org.opencontainers.image.source https://github.com/su2code/Docker-Builds

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY runTests.sh /runTests.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/runTests.sh"]
