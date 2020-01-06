#!/bin/bash

mkdir ~/.kube/
echo "${KUBECONFIG_FILE_CONTENTS}" > ~/.kube/config
echo "${INPUT_EXEC}" > run.sh
chod +x ./run.sh
./run.sh
rm ./run.sh