#!/bin/bash

# Setup kubectl configuration
set -e

CLUSTER_NAME=${1:-"jenkins-eks-cluster"}
AWS_REGION=${2:-"us-west-2"}

echo "Setting up kubectl for cluster: $CLUSTER_NAME in region: $AWS_REGION"

# Update kubeconfig
aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME

# Verify cluster access
kubectl cluster-info
kubectl get nodes

echo "Kubectl setup completed successfully!"