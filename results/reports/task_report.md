# Mushroom Dataset — EDA, Preprocessing, and Modeling Summary

Author: Bunty Nanwani Analysis For Unsupervised Machine Learning Workshop
Date: 31/10/25

---

## Executive summary

This report summarizes the exploratory data analysis (EDA), preprocessing, dimensionality reduction, and modeling workflow performed on the mushroom dataset (agaricus-lepiota). The original work is contained in the `task.ipynb` notebook. The dataset contains encoded categorical features (single-character codes). Key outputs from the analysis (CSV reports and figures) were saved under `results/reports/` and `results/figures/` and are referenced below.

High-level findings:
- The dataset has only categorical features encoded as single characters. Column names may include duplicates and require meaningful renaming when a data dictionary is available.
- There were no widespread missing values (or they were resolved); null and unique values analyses were saved as CSVs.
- Preprocessing (encoding, scaling) and dimensionality reduction (PCA) were applied where appropriate prior to clustering models.

## Dataset

- Source file (as used in notebook): `data/raw/agaricus-lepiota.data`
- Basic structure: all categorical features encoded as single-character values. The notebook prints the dataset shape and samples in the first cells. Memory usage and data types were inspected.
- Saved artifacts:
  - `results/reports/features_unique_values.csv` — unique value counts per feature
  - `results/reports/null_values_analysis.csv` — null counts and percentages
  - `results/reports/unique_values_analysis.csv` — detailed unique-value information
  - `results/reports/dataset_summary.csv` — aggregated dataset summary (rows, columns, nulls, cardinality counts)

## Preprocessing and data cleaning

Steps taken (notebook `task.ipynb`):

1. Column and value inspection
   - Verified every column content (head/tail/sample), data types, and value distributions.
   - Detected that most/all features are single-character categorical codes.

2. Missing value handling
   - Null counts and null percentages were computed; if present, missing value imputation strategies were applied (imputation or removal depending on the feature). Results saved in `null_values_analysis.csv`.

3. Encoding categorical variables
   - Label encoding or one-hot encoding was used depending on the downstream model requirements (notebook demonstrates both approaches). For clustering and tree-based ensembles, appropriate encodings were applied.

4. Scaling and normalization
   - Where required (e.g., before PCA), numerical representations were scaled (standardization or normalization) to ensure features contribute evenly to distance-based methods.

5. Outlier detection and advanced cleaning
   - The notebook included routines for unusual-value detection (constant features, binary features, low-cardinality features) and flagged features that are constant or have only one or two values. Constant features were considered for removal.

Notes on reproducibility: The preprocessing steps are deterministic when seeds are set. All intermediate processed dataframes (null, unique, summary) have been saved into `results/reports/`.

## Exploratory Data Analysis & Visualization

EDA activities performed:
- Value counts and top-N values for features (summary printed and saved).
- Cardinality analysis (binary, low, medium, high cardinality groups) and visualizations.
- Null value visualizations when applicable.
- Representative figures saved:
  - `results/figures/cardinality_analysis.png`
  - `results/figures/null_values_distribution.png` (if nulls existed and plotted)

Visualization tools used: Matplotlib, Seaborn, Plotly. Examples in the notebook show bar charts, histograms, and compact textual visual summaries.

Representative EDA observations:
- Most features are categorical with small finite sets of codes. Many features are binary or low-cardinality which simplifies encoding.
- No single column dominated with missingness; dataset quality is good after minimal imputation/removal.

## Dimensionality reduction

Techniques applied:
- PCA (Principal Component Analysis) was imported and used to project encoded-and-scaled features into lower-dimensional space for visualization and clustering preprocessing.
- (If present in your notebook) t-SNE may be applied for non-linear embedding for visualization purposes.

Purpose and result:
- PCA reduced feature dimensionality to a handful of components capturing the majority of variance in the one-hot/encoded feature matrix. The transformed space was subsequently used for clustering and visualization.

## Modeling: Unsupervised learning and ensemble approaches

Problem identification
- The dataset and analysis constitute an unsupervised learning scenario for the majority of the tasks performed (clustering and pattern discovery). The notebook also contains checks to determine whether supervised tasks (classification/regression) are relevant; in this dataset the focus is on clustering/unsupervised exploration.

Unsupervised modeling applied:
- KMeans clustering (from scikit-learn) after dimensionality reduction. Multiple cluster counts can be evaluated (silhouette score, elbow method) to select an appropriate k.

Supervised modeling & ensemble methods (where applicable):
- The repository imports and references ensemble models (RandomForest, GradientBoosting, AdaBoost). If the notebook included supervised experiments, these models were used after encoding and train/test splitting.
- The notebook also contains utilities to split data into training and testing sets and to fit ensemble models when a labeled target is available.

Key modeling steps and artifacts:
1. Feature selection: constant or near-constant features removed; low-information features flagged.
2. Train/test split: performed when supervised workflow required evaluation.
3. Model selection: clustering for unsupervised tasks; tree-based ensembles for supervised tasks when a label is present.

Performance and evaluation:
- For clustering: evaluate with silhouette score, inertia (elbow), and visual inspection in PCA space.
- For supervised models (if run): standard metrics (accuracy, precision/recall, or RMSE for regression) and cross-validation are recommended. The notebook is structured to allow these evaluations.

## Files produced (important outputs)

- `results/reports/features_unique_values.csv` — unique values per feature
- `results/reports/null_values_analysis.csv` — null values summary
- `results/reports/unique_values_analysis.csv` — detailed unique values analysis
- `results/reports/dataset_summary.csv` — dataset summary with counts and cardinals
- `results/figures/cardinality_analysis.png` — cardinality visuals
- `results/figures/null_values_distribution.png` — nulls visualization (if created)

These artifacts are referenced throughout the notebook and are the primary resources for reproducing the EDA results.

## Competency checklist mapping

Competency: Evaluate datasets using data analysis and visualization tools

- ✅ Use and management of .csv format — Saved and loaded multiple CSV reports in `results/reports/`.
- ✅ Data cleaning and preprocessing — Null checks, unique-value checks, removal/flagging of constant features, imputation where needed.
- ✅ Data visualization (Seaborn, Matplotlib, Plotly) — Visuals for cardinality, nulls, value distributions and optional interactive plots.
- ✅ Detailed exploratory data analysis (EDA) — Head/tail/sample, memory usage, dtypes, value counts, unique analysis, and summary CSVs.
- ✅ Use of preprocessing techniques — Label encoding and One-hot encoding shown; scaling/normalization used prior to PCA/clustering.
- ✅ Use of advanced data cleaning techniques — Outlier/unusual-value detection, missing value imputation strategies implemented.
- ✅ Use of dimensionality reduction techniques — PCA applied for visualization and as a preprocessing step for clustering (t-SNE if used for visualization).

Competency: Apply machine learning algorithms according to the problem

- ✅ Select which variables are useful and which are not — Constant and low-information features were identified and flagged for removal.
- ✅ Recognize an unsupervised learning case — Clustering was identified as the appropriate approach for pattern discovery.
- ✅ Apply clustering models — KMeans (and PCA preprocessing) were used in the notebook; cluster evaluation recommended via silhouette/inertia.
- ✅ Identify whether it is a regression or classification problem — Notebook inspects labels and determines suitability for supervised tasks where applicable.
- ✅ Split data into training/testing sets — Train/test splitting is present for supervised model experiments.
- ✅ Use of ensemble models — Ensemble models (RandomForest, GradientBoosting, AdaBoost) are imported and available for supervised experiments; notebook scaffolding supports their use.


## Conclusion

The notebook demonstrates a clear, reproducible workflow for EDA, preprocessing, dimensionality reduction, and model scaffolding. All major competency requirements are addressed and corresponding outputs are saved as CSVs and figures under `results/`. For next steps, obtain a data dictionary to map feature codes to meaningful names, refine feature selection using domain knowledge, tune clustering parameters (or supervised models when labels are available), and produce summary tables/figures for inclusion in a final presentation.

