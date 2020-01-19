#!/bin/sh

set -e

if [ ! -z $INPUT_KUBECONFIG ] ; then
  echo -e "\033[36mSetting up kubectl configuration\033[0m"
  mkdir ~/.kube/ || true
  echo "${INPUT_KUBECONFIG}" >> ~/.kube/config
fi

echo -e "\033[36mPreparing helm execution\033[0m"
echo "${INPUT_EXEC}" > run.sh
chmod +x ./run.sh

echo -e "\033[36mExecuting helm\033[0m"
./run.sh

echo -e "\033[36mCleaning up: \033[0m"
rm ./run.sh -Rf
echo -e "\033[36m  - exec ✅ \033[0m"
if [ ! -z $INPUT_KUBECONFIG ] && [ $INPUT_KUBECONFIG_CLEANUP != "false" ] ; then
  rm ~/.kube/config -Rf
  echo -e "\033[36m  - kubeconfig ✅ \033[0m"
fi
