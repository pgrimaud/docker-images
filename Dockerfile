FROM alpine:3.12

RUN apk update && \
apk add curl python2

RUN curl -s https://shopify.github.io/themekit/scripts/install.py | python && \
theme version
