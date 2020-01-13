#!/bin/sh

echo -e "\033[36mSetting up kubectl configuration\033[0m"
mkdir ~/.kube/
echo "${KUBECONFIG_FILE_CONTENTS}" > ~/.kube/config

echo -e "\033[36mPreparing helm execution\033[0m"
echo -e "#!/bin/sh\r\n\r\n${INPUT_EXEC}" > run.sh
chmod +x ./run.sh

echo -e "\033[36mExecuting helm\033[0m"
./run.sh

echo -e "\033[36mCleaning up\033[0m"
rm ./run.sh ~/.kube/ -Rf
