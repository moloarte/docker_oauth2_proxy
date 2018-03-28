FROM alpine:3.7
LABEL MAINTAINER="Manuel O."

ENV COOKIE_SECRET \
    CLIENT_ID \
    CLIENT_SECRET \
    EMAIL_DOMAIN \ 
    UPSTREAM="http://localhost:8080" \
    HTTP_ADDRESS="0.0.0.0:4180"

COPY templates/bin/oauth2_proxy /usr/bin

CMD oauth2_proxy -cookie-secret=${COOKIE_SECRET} -client-id=${CLIENT_ID} -client-secret=${CLIENT_SECRET} \
    -email-domain=${EMAIL_DOMAIN} -upstream=${UPSTREAM} -http-address=${HTTP_ADDRESS}