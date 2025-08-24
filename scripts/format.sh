#!/bin/bash

# Code formatting script
set -e

echo "🔧 Running code quality tools..."

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "❌ Virtual environment not found. Run 'uv sync --extra dev' first."
    exit 1
fi

echo "📦 Sorting imports with isort..."
uv run isort . --check-only --diff

echo "🖤 Formatting code with black..."
uv run black . --check --diff

echo "🔍 Running flake8 linting..."
uv run flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics

echo "🎯 Running type checking with mypy..."
uv run mypy backend/ main.py --ignore-missing-imports

echo "✅ All code quality checks passed!"