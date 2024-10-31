#!/bin/bash

# This script will tear down the API and re-deploy it

eval $(minikube docker-env)
docker build -t homebase .
kubectl delete deployment homebase
kubectl apply -f k8s/homebase-deployment.yml
