# primenumber-web-service

[![Java CI with Gradle](https://github.com/deepaksisupal/primenumber-web-service/actions/workflows/build_and_push.yml/badge.svg)](https://github.com/deepaksisupal/primenumber-web-service/actions/workflows/build_and_push.yml)

## Prerequisite
### For saving tf state
Create an blob storage to serve as terraform backend. This is a one time stuff.
```
az login 
az account set -s <id>
RESOURCE_GROUP_NAME=tstates
STORAGE_ACCOUNT_NAME=primenumber091
CONTAINER_NAME=tstate
az group create --name $RESOURCE_GROUP_NAME --location northeurope
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME -o json --query '[0].value')
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
```
### Clean up
```
az group delete --name $RESOURCE_GROUP_NAME --no-wait --yes
```
