# docker-gam

Allows running `gam` using environment variables instead of local files.

## Usage

1. Build Docker image with `make`
1. Generate necessary credentials as described [here](https://github.com/call/docker-gam).
1. Export necessary variables `GAM_OAUTHFILE` and `GAM_CLIENTSECRETS`

   ```bash
   export GAM_OAUTHFILE=`base64 secrets/oauth2.txt`
   export GAM_CLIENTSECRETS=`base64 secrets/client_secrets.json`
   ```

1. Run it like

   ```bash
   docker run -it --rm -e GAM_OAUTHFILE -e GAM_CLIENTSECRETS docker-gam info domain
   docker run -it --rm -e GAM_OAUTHFILE -e GAM_CLIENTSECRETS docker-gam info user me@domain.com
   ```