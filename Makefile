PY310 := $(shell command -v python3 2> /dev/null)
ifndef PY310
    PY310 := $(shell command -v python 2> /dev/null)
endif

SHELL:=/bin/bash

# Used for colorizing output of echo messages
BLUE := "\\033[1\;36m"
LBLUE := "\\033[1\;34m"
LRED := "\\033[1\;31m"
YELLOW := "\\033[1\;33m"
NC := "\\033[0m" # No color/default

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
  match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
  if match:
    target, help = match.groups()
    print("%-20s %s" % (target, help))
endef

export PRINT_HELP_PYSCRIPT

help: 
	@$(PY38) -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

clean: ## clean up all the things
	@$(MAKE) print-status MSG="Clean up stale build artifacts"
	@for trash in _build .coverage *.egg-info .pytest_cache; do \
		if [ -f $$trash ] || [ -d $$trash ]; then \
			rm -rf $$trash ; \
		fi ; \
	done
	@find . -name '*.pyc' | xargs rm -rf
	@find . -name '__pycache__' | xargs rm -rf
	@if [ ! -d "/nix" ]; then nix-collect-garbage -d; fi

print-error:
	@:$(call check_defined, MSG, Message to print)
	@echo -e "$(LRED)$(MSG)$(NC)"

print-status:
	@:$(call check_defined, MSG, Message to print)
	@echo -e "$(BLUE)$(MSG)$(NC)"

python: ## build the python env
	@$(PY310) -m venv _build 
	. _build/bin/activate
	@$(PY310) -m pip install --upgrade pip
	@$(PY310) -m pip install tox
	@$(PY310) -m pip install -r requirements.txt --no-warn-script-location

