# ==============================  REPRODUCTIBILITY AND HARDENING ==============================
SHELL :=/bin/bash
SHELLFLAGS := -eu -o pipefail -c
# ============== COLOR ANSI ==============
INFO_COLOR := \033[36;1m
WARNING_COLOR := \033[33;1m
ERROR_COLOR := \033[31;1m
RESET_COLOR := \033[0m


.PHONY: help terraform

help: ## shows this help
	@grep -E "^[a-z09A-Z._-]+:.*?## .*$$" $(MAKEFILE_LIST) |\
	sort | awk 'BEGIN {FS=":.*?##"} {printf "$(INFO_COLOR)%-20s$(RESET_COLOR)%s\n", $$1, $$2}'

ansible: ## show ansible version
	@ansible --version

terraform: ## shows terraform version
	@terraform -v