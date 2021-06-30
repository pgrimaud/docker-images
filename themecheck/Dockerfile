# Builder image to build theme check
FROM ruby:2.7-alpine AS builder

RUN apk update && \
    apk add --no-cache build-base

RUN gem install theme-check

# Final image, 70% lighter
FROM ruby:2.7-alpine

LABEL org.opencontainers.image.source="https://github.com/pgrimaud/docker-images"

# Copy the entire gems directory for builder image, containing the already built artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/