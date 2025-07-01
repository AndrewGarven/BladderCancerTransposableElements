# RNA-Seq Classifier

This repository contains a pipeline for training and evaluating a supervised machine learning model to classify RNA sequencing data based on Transposable Element expression profiles. The final trained model is saved at:

```
results/rna_seq_classifier.joblib
```

## Repository Structure

```
├── Main.ipynb * Main Working Notebook *
├── results/
│   └── rna_seq_classifier.joblib  * Final Model *
│   └── TCGA_clustering_result.csv 
│   └── UROMOL_clustering_result.csv * Clustering Assignment *
│   └── PURE01_clustering_result.csv  
├── Plots/
│   └── TCGA_UROMOL_diff_gsva
│   └── ...
├── data/                      
├── requirements.txt
```

## Model Summary

- Model: Random Forest Classifier (`sklearn.ensemble.RandomForestClassifier`)
- Input: Scaled RNA-Seq gene expression features
- Output: Predicted sample class (binary or multiclass)

The pipeline includes the following steps:
- Data loading and preprocessing
- Feature scaling
- Stratified train-test splitting
- Hyperparameter tuning via grid search with cross-validation
- Model training and performance evaluation
- Model export using `joblib`

## Usage

To rerun or modify the workflow, open and execute `Main.ipynb` in a Jupyter environment.

To load and use the pretrained model:

```python
import joblib

model = joblib.load("results/rna_seq_classifier.joblib")
# predictions = model.predict(X_new)
```

Ensure that `X_new` is preprocessed in the same way as the training data.

1. vst-normalized (Deseq2)
2. StandardScaler (Sklearn)

## Requirements

The minimum required working environment is as follows:
Python >= 3.8 and the following packages:

- pandas
- numpy
- scikit-learn
- matplotlib (optional, for visualizations)

Install them with:

```bash
pip install -r requirements.txt
```

## Evaluation

The notebook reports standard classification metrics including:

- Accuracy
- Confusion matrix
- ROC-AUC

## Notes

- The model assumes input data has been normalized or scaled (StandardScaler).
- The pipeline can be extended to other omics datasets with minimal changes.

