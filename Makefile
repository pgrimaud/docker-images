REGISTRY_HOST=ghcr.io
USERNAME=pgrimaud
LAST_VERSION_THEMEKIT=1.0.1

.PHONY: help

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-20s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

themekit-image: ## Build themekit image & push it to GitHub registry
	cd ./themekit && \
	docker build -t themekit . && \
	docker tag themekit $(REGISTRY_HOST)/$(USERNAME)/themekit:$(LAST_VERSION_THEMEKIT) && \
	docker push $(REGISTRY_HOST)/$(USERNAME)/themekit:$(LAST_VERSION_THEMEKIT) && \
	docker tag themekit $(REGISTRY_HOST)/$(USERNAME)/themekit:latest && \
	docker push $(REGISTRY_HOST)/$(USERNAME)/themekit:latest

themecheck-image: ## Build themecheck image & push it to GitHub registry
	cd ./themecheck && \
	docker build -t themecheck . && \
	docker tag themecheck $(REGISTRY_HOST)/$(USERNAME)/themecheck:latest && \
	docker push $(REGISTRY_HOST)/$(USERNAME)/themecheck:latest