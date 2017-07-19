# Problem statement
creates an azure active directory app (if it doesn't already exist)

# Example usage

> note: in examples, VERSION represents a version of the azure.activedirectory.app.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.activedirectory.app.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.activedirectory.app.create#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.activedirectory.app.create#VERSION }
    inputs:
      subscriptionId:
      loginId:
      loginSecret:
      displayName:
      homepage:
      identifierUris:
      # begin optional args
      endDate:
      isAvailableToOtherTenants:
      keyUsage:
      keyType:
      key:
      loginTenantId:
      loginType:
      password:
      replyUrls:
      startDate:
      # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.activedirectory.app.create/issues)
