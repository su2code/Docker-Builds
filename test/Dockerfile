ARG ghcr.io/su2code/su2/build-su2:220614-1237

FROM $BASE_IMAGE

LABEL org.opencontainers.image.source https://github.com/su2code/Docker-Builds

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY runTests.sh /runTests.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/runTests.sh"]
