#!/bin/bash

CONTAINER_NAME="cv-server"
IMAGE_NAME="min-cv-side"
PORT=8080

echo "🛑 Stopper og fjerner eksisterende container (hvis den finnes)..."
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

echo "🐳 Bygger Docker-image..."
docker build -t $IMAGE_NAME .

echo "🚀 Starter container på http://localhost:$PORT"
docker run -d -p $PORT:80 --name $CONTAINER_NAME $IMAGE_NAME
http://localhost:8080/