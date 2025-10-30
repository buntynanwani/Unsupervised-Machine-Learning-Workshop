# Contributing Guidelines

## Getting Started

1. Clone the repository
2. Create a virtual environment: `python -m venv venv`
3. Activate the environment:
   - Windows: `venv\Scripts\activate`
   - Linux/Mac: `source venv/bin/activate`
4. Install dependencies: `pip install -r requirements.txt`
5. Install dev dependencies: `pip install -r requirements-dev.txt`

## Workflow

1. Create a new branch for your feature: `git checkout -b feature/your-feature-name`
2. Make your changes
3. Run tests: `pytest tests/`
4. Commit your changes with clear messages
5. Push and create a Pull Request

## Code Style

- Follow PEP 8 guidelines
- Use meaningful variable names
- Add docstrings to functions and classes
- Keep functions small and focused
- Add comments for complex logic

## Project Structure

- `data/`: Store datasets here (raw, processed, external)
- `notebooks/`: Jupyter notebooks for exploration and analysis
- `src/`: Reusable Python modules
- `scripts/`: Executable scripts for running pipelines
- `tests/`: Unit tests for code validation
- `results/`: Output files (models, figures, reports)
