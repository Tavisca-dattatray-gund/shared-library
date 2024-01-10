#!/usr/bin/env bash

NETWORK_NAME="jenkins"
DOCKER_IMAGE="jenkins/jenkins"

function create_network() {
  echo "Creating docker network..."
  if ! docker network inspect $NETWORK_NAME &> /dev/null; then
    docker network create $NETWORK_NAME
  fi
  echo "Network created..."
}

function run_docker_container() {
    echo "Starting docker container..."
    docker run --name jenkins --rm --detach \
           --privileged \
           --network $NETWORK_NAME \
           --network-alias docker \
           --env DOCKER_TLS_CERTDIR=/certs \
           --env JAVA_OPTS=-Djavax.net.ssl.trustStore=/cacerts \
           -p 80:8080 \
           -p 50000:50000 \
           -v jenkins_home:/var/jenkins_home \
           -v /Users/i807913/.sdkman/candidates/java/21.0.1-graalce/lib/security/cacerts:/cacerts \
           $DOCKER_IMAGE
}

function main() {

    # Check if Docker is running
    if (! docker stats --no-stream ); then
      echo "Docker is not running... Starting Docker..."
      # If Docker is not running, open it
      open /Applications/Docker.app

      # Wait until Docker is running
      while (! docker stats --no-stream ); do
        echo "Waiting for Docker to launch..."
        sleep 5
     done
    fi

    create_network
    run_docker_container
}

main