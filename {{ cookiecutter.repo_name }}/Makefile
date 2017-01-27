# Docker compose run parameters.
DOCKER_COMPOSE_RUN_CMD = docker-compose run
DOCKER_COMPOSE_RUN_OPTS = --no-deps --rm
DOCKER_COMPOSE_RUN_SVC = django
DOCKER_COMPOSE_RUN_FULL = $(DOCKER_COMPOSE_RUN_CMD) $(DOCKER_COMPOSE_RUN_OPTS) $(DOCKER_COMPOSE_RUN_SVC)

# Others.
PYTHON_EXE = python3
TOPDIR = $(shell git rev-parse --show-toplevel)

help:
	@echo "ci-coala           - Run the static analyzers"
	@echo "ci-docs            - Ensure the documentation builds"
	@echo "ci-tests           - Run the unit tests"
	@echo "clean              - Remove unwanted files in project (!DESTRUCTIVE!)"
	@echo "docs               - Build documentation"
	@echo "format             - Format the codebase using YAPF"
	@echo "format-check       - Check the code formatting using YAPF"
	@echo "venv               - Setup local venv"
	@echo "wheel              - Build a wheel package"

ci-coala:
	@docker run -t -v=$$(pwd):/app --workdir=/app coala/base:pre coala --ci

ci-docs:
	$(DOCKER_COMPOSE_RUN_FULL) tox -e docs

ci-tests:
	$(DOCKER_COMPOSE_RUN_FULL) tox -e py35

clean:
	cd $(TOPDIR); git clean -ffdx

docs:
	$(DOCKER_COMPOSE_RUN_FULL) python setup.py build_sphinx --builder=html

format:
	$(DOCKER_COMPOSE_RUN_FULL) yapf -r -i .

format-check:
	$(DOCKER_COMPOSE_RUN_FULL) yapf -r -d .

venv: venv/bin/activate

venv/bin/activate: requirements/local.txt
	test -d venv || virtualenv -p $(PYTHON_EXE) venv
	. venv/bin/activate; pip install -U pip; pip install -r requirements/local.txt

wheel:
	$(DOCKER_COMPOSE_RUN_FULL) python setup.py bdist_wheel

.PHONY: ci-coala ci-docs ci-python clean docs docker-build docker-build-base format format-check wheel
