#!/bin/sh

mkdir ~/.kube/
echo "${KUBECONFIG_FILE_CONTENTS}" > ~/.kube/config
echo "helm ${INPUT_ARGS}" > /tmp/run.sh
cat /tmp/run.sh
chmod +x /tmp/run.sh
/tmp/run.sh
rm /tmp/run.sh
