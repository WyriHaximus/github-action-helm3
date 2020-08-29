#!/bin/sh

set -e

echo -e "\033[36mSetting up kubectl configuration\033[0m"
mkdir -p ~/.kube/
echo "${INPUT_KUBECONFIG}" > ~/.kube/config

echo -e "\033[36mPreparing helm execution\033[0m"
echo "${INPUT_EXEC}" > run.sh
chmod +x ./run.sh

echo -e "\033[36mExecuting helm\033[0m"
helm_output=$(./run.sh)
echo "$helm_output"

helm_output="${helm_output//'%'/'%25'}"
helm_output="${helm_output//$'\n'/'%0A'}"
helm_output="${helm_output//$'\r'/'%0D'}"

echo "::set-output name=helm_output::$helm_output"

echo -e "\033[36mCleaning up: \033[0m"
rm ./run.sh -Rf
echo -e "\033[36m  - exec ✅ \033[0m"
rm ~/.kube/config -Rf
echo -e "\033[36m  - kubeconfig ✅ \033[0m"
