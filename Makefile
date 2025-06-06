ifdef OS
	PYTHON ?= .venv/Scripts/python.exe
	TYPE_CHECK_COMMAND ?= echo Pytype package doesn't support Windows OS
else
	PYTHON ?= .venv/bin/python
	TYPE_CHECK_COMMAND ?= ${PYTHON} -m pytype --config=pytype.cfg src
endif

SETTINGS_FILENAME = pyproject.toml

PHONY = help install install-dev build format lint type-check secure test install-flit enable-pre-commit-hooks run activate-venv create-venv check-branch-name check-conventional-commit

help:
	@echo "--------------- HELP ---------------"
	@echo "To install the project -> make install"
	@echo "To install the project using symlinks (for development) -> make install-dev"
	@echo "To build the wheel package -> make build"
	@echo "To test the project -> make test"
	@echo "To test with coverage [all tests] -> make test-cov"
	@echo "To format code -> make format"
	@echo "To check linter -> make lint"
	@echo "To run type checker -> make type-check"
	@echo "To run all security related commands -> make secure"
	@echo "------------------------------------"

install:
	${PYTHON} -m flit install --env --deps=production

install-dev:
	${PYTHON} -m flit install -s --env --deps=develop --symlink

install-flit:
	${PYTHON} -m pip install flit==3.8.0

enable-pre-commit-hooks:
	${PYTHON} -m pre_commit install

build:
	${PYTHON} -m flit build --format wheel
	${PYTHON} -m pip install dist/*.whl
	${PYTHON} -c 'import pytemplate; print(pytemplate.__version__)'

format:
	${PYTHON} -m isort src tests --force-single-line-imports --settings-file ${SETTINGS_FILENAME}
	${PYTHON} -m autoflake --remove-all-unused-imports --recursive --remove-unused-variables --in-place src --exclude=__init__.py
	${PYTHON} -m black src tests --config ${SETTINGS_FILENAME}
	${PYTHON} -m isort src tests --settings-file ${SETTINGS_FILENAME}

lint:
	${PYTHON} -m flake8 --toml-config ${SETTINGS_FILENAME} --max-complexity 5 --max-cognitive-complexity=5 src
	${PYTHON} -m black src tests --check --diff --config ${SETTINGS_FILENAME}
	${PYTHON} -m isort src tests --check --diff --settings-file ${SETTINGS_FILENAME}

type-check:
	@$(TYPE_CHECK_COMMAND)

secure:
	${PYTHON} -m bandit -r src --config ${SETTINGS_FILENAME}

test:
	${PYTHON} -m pytest -svvv -m "not slow and not integration" tests

test-slow:
	${PYTHON} -m pytest -svvv -m "slow" tests

test-integration:
	${PYTHON} -m pytest -svvv -m "integration" tests

test-cov:
	@if find tests -type f -name 'test_*.py' | grep -q .; then \
		${PYTHON} -m pytest --cov=src --cov-report=term-missing; \
		${PYTHON} -m coverage report --fail-under=96; \
	else \
		echo "⚠️  No tests found. Skipping coverage check. If tests are needed, but you don't write them, it will fail in CI checks" 1>&2; \
	fi

run:
	${PYTHON} -m src.pytemplate.main

activate-venv:
	@echo "To activate the virtual environment, run:"
ifeq ($(OS),Windows_NT)
	@echo ".venv\\Scripts\\activate"
else
	@echo "source .venv/bin/activate"
endif

create-venv:
	python3 -m pip install --upgrade pip
	python3 -m pip install virtualenv
	python3 -m virtualenv .venv

check-branch-name:
	@BRANCH_NAME=$$(git rev-parse --abbrev-ref HEAD); \
	if [ "$$BRANCH_NAME" = "main" ]; then \
		echo "✅ Branch name '$$BRANCH_NAME' is valid (main branch excluded from check)."; \
		exit 0; \
	fi; \
	PATTERN="^launch_[0-9]+_task_[0-9]+$$"; \
	if ! echo "$$BRANCH_NAME" | grep -Eq "$$PATTERN"; then \
		echo "❌ Branch name '$$BRANCH_NAME' does not match the required pattern: launch_{number}_task_{number}"; \
		exit 1; \
	else \
		echo "✅ Branch name '$$BRANCH_NAME' is valid."; \
	fi
