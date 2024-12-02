# Logistic_Model_Cancer_Diagnosis
Logistic Regression on Simulated Breast Cancer Data
Project Overview
This project demonstrates the use of logistic regression to predict breast cancer diagnosis (Benign or Malignant) using a simulated dataset. The main goal is to build a predictive model that classifies breast cancer diagnoses based on various features. The dataset is split into training and testing sets, and the logistic regression model is evaluated using standard performance metrics.

Files
Script File: Contains the R code to perform data analysis and build the logistic regression model.
Dataset: simulated_breast_cancer_data.csv - Simulated dataset containing features for breast cancer prediction.
Methodology

Data Preparation:
The dataset is loaded and explored.
The target variable Diagnosis is converted into a binary factor (0 = Benign, 1 = Malignant).

Data Splitting
The data is split into an 80% training set and a 20% testing set using stratified sampling to maintain class balance.

Model Training
A logistic regression model is fitted using the training set.
Model Evaluation:

Predictions are made on the test set, and a confusion matrix is generated to evaluate the model's performance.
Metrics such as accuracy, sensitivity, and specificity are analyzed.

Feature Importance:
The relative importance of features is visualized using their estimated coefficients.

Key Libraries Used
tidyverse For data manipulation and visualization.
caret For data partitioning and evaluation.
broom To tidy model outputs.
ggplot2 For creating visualizations.
How to Run the Code
Install the required R libraries if they are not already installed:
install.packages(c("tidyverse", "caret", "broom", "ggplot2"))
Update the file path in the code to match the location of simulated_breast_cancer_data.csv.
Run the script in RStudio or any R environment.

Outputs
Model Summary Displays coefficients, p-values, and other statistics for the logistic regression model.
Confusion Matrix Provides evaluation metrics such as accuracy, sensitivity, and specificity.
Feature Importance Plot A visualization showing the impact of each feature on the model.
Potential Applications
This approach can be extended to other binary classification problems in healthcare, finance, or other fields where logistic regression is appropriate.
