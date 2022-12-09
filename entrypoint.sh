#!/bin/sh

set -e

echo -e "\033[36mSetting up kubectl configuration\033[0m"

mkdir ~/.kube/ || true
if [ -f "~/.kube/config" ]; then
  echo -e "\033[36mExisting kubeconfig found, using that and ignoring input\033[0m"
else
  echo -e "\033[36mUsing kubeconfig from input\033[0m"
  echo "${INPUT_KUBECONFIG}" > ~/.kube/config
fi

echo -e "\033[36mPreparing helm execution\033[0m"
echo "${INPUT_EXEC}" > run.sh
chmod +x ./run.sh

echo -e "\033[36mExecuting helm\033[0m"
helm_output=$(./run.sh)
echo "$helm_output"

delimiter="$(openssl rand -hex 8)"
echo "helm_output<<${delimiter}" >> "${GITHUB_OUTPUT}"
echo "$helm_output" >> "${GITHUB_OUTPUT}"
echo "${delimiter}" >> "${GITHUB_OUTPUT}"

echo -e "\033[36mCleaning up: \033[0m"
rm ./run.sh -Rf
echo -e "\033[36m  - exec ✅ \033[0m"
rm ~/.kube/config -Rf
echo -e "\033[36m  - kubeconfig ✅ \033[0m"
