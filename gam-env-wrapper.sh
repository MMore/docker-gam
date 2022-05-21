#!/usr/bin/env bash

GAMDIR=/gam
GAMCFGDIR=/config/.gam
OAUTHFILE=/gam/oauth2.txt
CLIENTSECRETS=/gam/client_secrets.json

export GAMDIR GAMCFGDIR OAUTHFILE CLIENTSECRETS

if [ -z "$GAM_OAUTHFILE" ]; then
  echo "GAM_OAUTHFILE needs to be set"
  exit 1
fi

if [ -z "$GAM_CLIENTSECRETS" ]; then
  echo "GAM_CLIENTSECRETS needs to be set"
  exit 1
fi

echo $GAM_OAUTHFILE|base64 -d > oauth2.txt
echo $GAM_CLIENTSECRETS|base64 -d > client_secrets.json

python "${GAMDIR}/src/gam.py" "$@"