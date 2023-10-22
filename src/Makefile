.PHONY: help build clean run default all

default: all

help: ## Display available commands
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean: ## Clean build items
	dune clean

build: ## Build the app
	dune build

run: ## Run the app
	dune exec standaml

all: ## The simplest option (build, run and then clean)
	$(MAKE) build
	$(MAKE) run
	$(MAKE) clean
