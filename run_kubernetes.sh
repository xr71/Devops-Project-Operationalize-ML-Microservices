#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
# should be same as what was pushed in upload_docker.sh

dockerpath=xuren71/my-ml-microservice



# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment mlkluster --image=$dockerpath


# Step 3:
# List kubernetes pods
kubectl get pods


# Step 4:
# Forward the container port to a host
kubectl port-forward $(kubectl get pods -o=name | grep mlkluster) 8000:80

