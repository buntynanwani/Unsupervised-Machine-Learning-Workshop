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
