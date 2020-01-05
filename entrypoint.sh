#!/bin/bash

mkdir ~/.kube/
echo "${KUBECONFIG_FILE_CONTENTS}" > ~/.kube/config
echo "helm ${INPUT_ARGS}" > /tmp/run.sh
chod +x /tmp/run.sh
/tmp/run.sh
rm /tmp/run.sh