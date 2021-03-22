REGISTRY_HOST=ghcr.io
USERNAME=pgrimaud

.PHONY: help

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-20s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

themekit-image: ## Build themekit image & push it to GitHub registry
	cd ./themekit && \
	docker build -t themekit . && \
	docker tag themekit $(REGISTRY_HOST)/$(USERNAME)/themekit:latest && \
	docker push $(REGISTRY_HOST)/$(USERNAME)/themekit:latest