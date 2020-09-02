#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#VAULT_BIN="${DIR}/../../../vault/vault"
VAULT_BIN="/Users/wangxuanzhong/Documents/valut/vault"

echo $VAULT_ADDR

echo "###########################################################################"
echo "# Preparing policies                                                      #"
echo "###########################################################################"

#${VAULT_BIN} policy write read-secret ${DIR}/read-secret-policy.conf

echo "###########################################################################"
echo "# Restoring non-versioned K/V backend at secret/                          #"
echo "###########################################################################"

${VAULT_BIN} secrets disable secret
${VAULT_BIN} secrets enable -path secret -version 1 kv

#echo "###########################################################################"
#echo "# Mounting versioned K/V backend at versioned/                            #"
#echo "###########################################################################"
#
#${VAULT_BIN} secrets enable -path versioned -version 2 kv

#echo "###########################################################################"
#echo "# Setup static AppId authentication                                       #"
#echo "###########################################################################"
#
#echo "vault auth enable app-id"
#${VAULT_BIN} auth enable app-id
#
#echo "vault write auth/app-id/map/app-id/my-spring-boot-app value=default display_name=spring-boot-app"
#${VAULT_BIN} write auth/app-id/map/app-id/my-spring-boot-app value=read-secret display_name=spring-boot-app
#
#echo "vault write auth/app-id/map/user-id/my-static-userid value=my-spring-boot-app"
#${VAULT_BIN} write auth/app-id/map/user-id/my-static-userid value=my-spring-boot-app


echo "###########################################################################"
echo "# Write test data to Vault                                                #"
echo "###########################################################################"

echo "vault kv put secret/my-spring-boot-app mykey=myvalue hello.world='Hello, World'"
${VAULT_BIN} kv put secret/my-spring-boot-app mykey=myvalue hello.world='Hello, World'

#${VAULT_BIN} kv put secret/my-spring-boot-app-2 mykey=myvalue-2 hello.world='Hello, World-2'
#
echo "vault kv put secret/my-spring-boot-app/cloud key_for_cloud_profile=value"
${VAULT_BIN} kv put secret/my-spring-boot-app/cloud key_for_cloud_profile=value
#
#echo "vault kv put secret/my-spring-app database.username=myuser database.password=mypassword"
#${VAULT_BIN} kv put secret/my-spring-app database.username=myuser database.password=mypassword
