# === targets ===

# main
MENU := env dev build test deploy env-core build-core test-core deploy-core

# menu > helper targets
MENU := help

# load phony
.PHONY: all clean test $(MENU)

# === variables ===

# set default target
.DEFAULT_GOAL := help

# === main ===

##@ Menu

# core commands

env: env-core 												## primes environment for project
	@echo ":: prime environment - ok ::"

dev:																	## run project in dev (as daemon if permits)
	@echo ":: run dev project - ok ::"

build: build-core											## build project
	@echo ":: build project - ok ::"

test: test-core 											## test project
	@echo ":: test project - ok ::"

deploy: deploy-core										## deploy files
	@echo ":: deploy project - ok ::"

# module commands

env-core:
	@echo ":: env-core ::"
	@echo "==> checking environment variables"
	# export $(cat .env | xargs) 				# load env files into current environment
	@echo "==> checking build dependancies"
	@command -v node || echo "missing node"
	@command -v semver || echo "missing semver"
	@command -v shellcheck || echo "missing shellcheck"
	@command -v bats || echo "missing bats-core"

build-core:
	@echo ":: build-core ::"
	@echo "==> check build dependancies"
	@command -v node
	@command -v semver
	@command -v shellcheck
	@command -v bats
	@echo "==> check environment variables"

test-core:
	@echo ":: test-core ::"
	bats -r test/*
	shellcheck src/*.sh

deploy-core:
	@echo ":: deploy-core ::"

##@ Helpers

help:												## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf "\n"; }' $(MAKEFILE_LIST)
