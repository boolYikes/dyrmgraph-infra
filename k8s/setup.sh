#!/bin/bash

helm repo add --force-update spark-operator https://kubeflow.github.io/spark-operator

# NOTE: must fix version
helm install spark-operator spark-operator/spark-operator \
    --namespace spark-operator \
    --create-namespace \
    --wait

# Tests for checking health
# kubectl apply -f https://raw.githubusercontent.com/kubeflow/spark-operator/refs/heads/master/examples/spark-pi.yaml
# kubectl get sparkapp spark-pi
# kubectl delete sparkapp spark-pi