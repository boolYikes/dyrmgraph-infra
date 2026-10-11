#!/bin/bash

SCRIPT_PATH="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

kubectl create secret generic manifest-pg-secret \
  --namespace=dyrmgraph \
  --from-env-file=$SCRIPT_PATH/manifest-pg.env \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl create secret generic minio-secret \
  --namespace=dyrmgraph \
  --from-env-file=$SCRIPT_PATH/minio.env \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl create secret generic airflow-secret \
  --namespace=dyrmgraph \
  --from-env-file=$SCRIPT_PATH/airflow.env \
  --dry-run=client -o yaml | kubectl apply -f -