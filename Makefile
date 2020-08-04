
# === info ===

# references
# - https://www.gnu.org/software/make/manual/html_node/Standard-Targets.html
# - https://tech.davis-hansson.com/p/make/

# notes
# - use $$ for escaping variable
# - use - to ignore errors (make)
# - use @ to not print the command

# === targets ===

# menu > main targets
MENU := env dev build test deploy

# menu > module targets
MENU := env-core build-core test-core deploy-core

# menu > helper targets
MENU := version vinit vpatch vminor vmajor help

# load phony
# info - phony is used to make sure there is no similar file(s) such as <target> that cause the make recipe not to work
.PHONY: all clean test $(MENU)

# === variables ===

# set default target
.DEFAULT_GOAL := help

# set fast fail so targets fail on error
# .SHELLFLAGS := -eu -o pipefail -c

# # set default shell to use
# SHELL := /bin/bash

# sets all lines in the recipe to be passed in a single shell invocation
# ref - https://www.gnu.org/software/make/manual/html_node/One-Shell.html
# warning - supported make > 3.82, ref - https://stackoverflow.com/questions/32153034/oneshell-not-working-properly-in-makefile
# recommend - use gmake rather than make to ensure oneshell works
# warning - oneshell is not POSIX standard
.ONESHELL:

# === check Make version ===

# ifeq ($(origin .RECIPEPREFIX), undefined)
#   $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
# endif

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

# semver tool based on - https://github.com/fsaintjacques/semver-tool

version: 									## show current version
	@git describe --tags --abbrev=0

vinit: 										## initialise first version
	@git tag 0.1.0

vpatch:										## show bumped version + patch (fix) - use : git tag $(make vpatch)
	@semver bump patch $$(git describe --tags --abbrev=0)

vminor:										## show bumped version + minor (non breaking) - use : git tag $(make vminor)
	@semver bump minor $$(git describe --tags --abbrev=0)

vmajor:										## show bumped version + major (breaking) - git tag $(make vmajor)
	@semver bump major $$(git describe --tags --abbrev=0)

help:												## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf "\n"; }' $(MAKEFILE_LIST)

# notes
#
# - npm semver patch uses @semver $$(git describe --tags --abbrev=0) -i patch
# - npm semver minor uses @semver $$(git describe --tags --abbrev=0) -i minor
# - $(MAKEFILE_LIST) is an environment variable (name of Makefile) thats available during Make.
# - FS = awks field separator. use it in the beginning of execution. i.e. FS = ","
