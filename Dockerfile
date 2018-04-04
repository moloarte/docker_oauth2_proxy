FROM alpine:3.7
LABEL MAINTAINER="Manuel O."

ENV COOKIE_SECRET \
    COOKIE_NAME="_oauth2_proxy" \
    CLIENT_ID \
    CLIENT_SECRET \
    EMAIL_DOMAIN \ 
    UPSTREAM="http://127.0.0.1:8080" \
    HTTP_ADDRESS="0.0.0.0:4180"  \
    REDIRECT_URL = "http://localhost:8080/oauth2/callback"

COPY templates/bin/oauth2_proxy /usr/bin

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates 2>/dev/null || true


EXPOSE 4180 4181

CMD oauth2_proxy -cookie-secret=${COOKIE_SECRET} -client-id=${CLIENT_ID} -client-secret=${CLIENT_SECRET} \
    -email-domain=${EMAIL_DOMAIN} -upstream=${UPSTREAM} -http-address=${HTTP_ADDRESS} \
    -cookie-name=${COOKIE_NAME} -set-xauthrequest -redirect-url=${REDIRECT_URL} \
    -cookie-secure=false