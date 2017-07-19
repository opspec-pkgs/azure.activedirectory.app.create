#!/usr/bin/env sh

set -e

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for exiting active directory app"
if [ "$(az ad app show --id "$identifierUris")" != "" ]
then
  echo "found exiting active directory app"
else
    createCmd='az ad app create'
    createCmd=$(printf "%s --display-name %s" "$createCmd" "$displayName")
    createCmd=$(printf "%s --homepage %s" "$createCmd" "$homepage")
    createCmd=$(printf "%s --identifier-uris %s" "$createCmd" "$identifierUris")

    # handle opts
    if [ "$endDate" != " " ]; then
        createCmd=$(printf "%s --end-date %s" "$createCmd" "$endDate")
    fi

    if [ "$isAvailableToOtherTenants" == "true" ]; then
        createCmd=$(printf "%s --available-to-other-tenants" "$createCmd")
    fi

    if [ "$keyUsage" != " " ]; then
        createCmd=$(printf "%s --key-usage %s" "$createCmd" "$keyUsage")
    fi

    if [ "$keyType" != " " ]; then
        createCmd=$(printf "%s --key-type %s" "$createCmd" "$keyType")
    fi

    if [ "$key" != " " ]; then
        createCmd=$(printf "%s --key-value %s" "$createCmd" "$key")
    fi

    if [ "$password" != " " ]; then
        createCmd=$(printf "%s --password %s" "$createCmd" "$password")
    fi

    if [ "$replyUrls" != " " ]; then
        createCmd=$(printf "%s --reply-urls %s" "$createCmd" "$replyUrls")
    fi

    if [ "$startDate" != " " ]; then
        createCmd=$(printf "%s --start-date %s" "$createCmd" "$startDate")
    fi


    echo "creating active directory app"
    eval "$createCmd"
fi
