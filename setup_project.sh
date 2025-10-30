#!/bin/bash

# Unsupervised ML Workshop - Project Structure Setup
# Run this script in Git Bash from your project root directory

echo "🚀 Creating Unsupervised ML Workshop project structure..."

# Create main data directories
mkdir -p data/raw
mkdir -p data/processed
mkdir -p data/external
mkdir -p data/reduced

# Create documentation directories
mkdir -p docs

# Create notebooks directory
mkdir -p notebooks

# Create source code directories
mkdir -p src/data
mkdir -p src/preprocessing
mkdir -p src/features
mkdir -p src/models
mkdir -p src/evaluation
mkdir -p src/visualization

# Create scripts directory
mkdir -p scripts

# Create tests directory
mkdir -p tests

# Create results directories
mkdir -p results/models
mkdir -p results/figures
mkdir -p results/reports
mkdir -p results/metrics

# Create config directory
mkdir -p config

# Create frontend placeholder
mkdir -p frontend

# Create __init__.py files for Python packages
touch src/__init__.py
touch src/data/__init__.py
touch src/preprocessing/__init__.py
touch src/features/__init__.py
touch src/models/__init__.py
touch src/evaluation/__init__.py
touch src/visualization/__init__.py
touch tests/__init__.py

# Create placeholder Python files in src
touch src/data/loader.py
touch src/data/validator.py
touch src/preprocessing/cleaner.py
touch src/preprocessing/scaler.py
touch src/preprocessing/encoder.py
touch src/preprocessing/imputer.py
touch src/features/selector.py
touch src/features/reducer.py
touch src/models/clustering.py
touch src/models/ensemble.py
touch src/models/trainer.py
touch src/evaluation/metrics.py
touch src/evaluation/validator.py
touch src/visualization/plotter.py
touch src/visualization/cluster_viz.py
touch src/visualization/eda_viz.py

# Create script files
touch scripts/run_preprocessing.py
touch scripts/run_clustering.py
touch scripts/run_dimensionality_reduction.py
touch scripts/run_full_pipeline.py
touch scripts/generate_report.py

# Create test files
touch tests/test_data_loader.py
touch tests/test_preprocessing.py
touch tests/test_features.py
touch tests/test_models.py
touch tests/test_visualization.py

# Create notebook files
touch notebooks/01_data_exploration_and_eda.ipynb
touch notebooks/02_data_cleaning_and_preprocessing.ipynb
touch notebooks/03_feature_engineering.ipynb
touch notebooks/04_dimensionality_reduction_pca.ipynb
touch notebooks/05_dimensionality_reduction_tsne.ipynb
touch notebooks/06_clustering_kmeans.ipynb
touch notebooks/07_clustering_hierarchical.ipynb
touch notebooks/08_clustering_dbscan.ipynb
touch notebooks/09_ensemble_models_comparison.ipynb
touch notebooks/10_final_analysis_and_conclusions.ipynb

# Create documentation files
touch docs/00_project_overview.md
touch docs/01_unsupervised_learning_fundamentals.md
touch docs/02_clustering_algorithms.md
touch docs/03_dimensionality_reduction.md
touch docs/04_evaluation_metrics.md
touch docs/05_preprocessing_techniques.md
touch docs/06_bibliography_and_resources.md

# Create config files
touch config/config.yaml
touch config/logging_config.yaml

# Create requirements files
cat > requirements.txt << 'EOF'
# Core Data Science Libraries
numpy>=1.24.0
pandas>=2.0.0
scipy>=1.10.0

# Visualization
matplotlib>=3.7.0
seaborn>=0.12.0
plotly>=5.14.0

# Machine Learning
scikit-learn>=1.3.0
xgboost>=1.7.0
lightgbm>=3.3.0

# Dimensionality Reduction
umap-learn>=0.5.3

# Jupyter
jupyter>=1.0.0
ipykernel>=6.22.0
ipywidgets>=8.0.0

# Utilities
pyyaml>=6.0
python-dotenv>=1.0.0
tqdm>=4.65.0
EOF

cat > requirements-dev.txt << 'EOF'
# Development Dependencies
pytest>=7.3.0
pytest-cov>=4.0.0
black>=23.3.0
flake8>=6.0.0
pylint>=2.17.0
mypy>=1.2.0
isort>=5.12.0
pre-commit>=3.2.0
EOF

# Create .gitignore
cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual Environment
venv/
env/
ENV/
.venv/

# Jupyter Notebook
.ipynb_checkpoints
*.ipynb_checkpoints/

# Data files (don't commit large datasets)
data/raw/*.csv
data/raw/*.xlsx
data/raw/*.json
data/processed/*.csv
data/processed/*.pkl
data/external/*.csv
*.h5
*.hdf5

# Models (don't commit large model files)
results/models/*.pkl
results/models/*.joblib
results/models/*.h5
*.model

# IDE
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# Environment variables
.env

# Logs
*.log
logs/

# OS
Thumbs.db
EOF

# Create .env.example
cat > .env.example << 'EOF'
# Environment Variables Example
# Copy this file to .env and fill in your values

# Project Configuration
PROJECT_NAME=unsupervised-ml-workshop
ENVIRONMENT=development

# Paths
DATA_PATH=./data
MODELS_PATH=./results/models
LOGS_PATH=./logs

# API Keys (if needed)
# API_KEY=your_api_key_here
EOF

# Create CONTRIBUTING.md
cat > CONTRIBUTING.md << 'EOF'
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
EOF

# Create setup.py
cat > setup.py << 'EOF'
from setuptools import setup, find_packages

setup(
    name="unsupervised-ml-workshop",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "numpy>=1.24.0",
        "pandas>=2.0.0",
        "scikit-learn>=1.3.0",
        "matplotlib>=3.7.0",
        "seaborn>=0.12.0",
        "plotly>=5.14.0",
    ],
    author="Your Name",
    author_email="your.email@example.com",
    description="Unsupervised Machine Learning Workshop",
    python_requires=">=3.8",
)
EOF

# Create frontend README
cat > frontend/README.md << 'EOF'
# Frontend Integration

This directory is reserved for future frontend development.

## Planned Features
- Dashboard for model results visualization
- Interactive data exploration interface
- Real-time clustering visualization
- Model comparison tools

## Setup Instructions
(To be added when frontend development begins)
EOF

# Create a data README
cat > data/README.md << 'EOF'
# Data Directory

## Structure

- `raw/`: Place your original, unmodified datasets here
- `processed/`: Cleaned and preprocessed datasets
- `external/`: Data from external sources or APIs
- `reduced/`: Dimensionality-reduced datasets (PCA, t-SNE outputs)

## Usage

1. Add your CSV files to `raw/` directory
2. Use notebooks to clean and preprocess data
3. Save processed data to `processed/` directory
4. Never commit large raw data files to Git (they're in .gitignore)

## Data Guidelines

- Keep raw data immutable
- Document data sources and preprocessing steps
- Use consistent naming conventions
- Add data descriptions in this README
EOF

echo ""
echo "✅ Project structure created successfully!"
echo ""
echo "📁 Directory structure:"
tree -L 2 -I 'venv|__pycache__|*.pyc' || find . -type d -not -path '*/\.*' -not -path '*/venv*' | sed 's|[^/]*/| |g'
echo ""
echo "🎯 Next steps:"
echo "1. Create and activate virtual environment:"
echo "   python -m venv venv"
echo "   source venv/bin/activate  (Linux/Mac)"
echo "   venv\\Scripts\\activate    (Windows)"
echo ""
echo "2. Install dependencies:"
echo "   pip install -r requirements.txt"
echo ""
echo "3. Place your datasets in the data/raw/ folder"
echo ""
echo "4. Start Jupyter and open notebooks/01_data_exploration_and_eda.ipynb:"
echo "   jupyter notebook"
echo ""
echo "5. Initialize git (if not already done):"
echo "   git add ."
echo "   git commit -m 'Initial project structure'"
echo "   git push"
echo ""
echo "🚀 Happy coding!"
