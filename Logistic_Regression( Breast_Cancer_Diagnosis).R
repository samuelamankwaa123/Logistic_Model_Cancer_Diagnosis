# Load necessary libraries
library(tidyverse)  # For data manipulation and visualization
library(caret)      # For machine learning tasks

# Load the simulated dataset
file_path <- "C:/Users/kasutaja/Documents/simulated_breast_cancer_data.csv"
cancer_data <- read.csv(file_path)

# Convert Diagnosis to a factor (target variable)
cancer_data$Diagnosis <- as.factor(cancer_data$Diagnosis)

# Encode Diagnosis: 0 for B, 1 for M
levels(cancer_data$Diagnosis) <- c(0, 1)

# View dataset summary
summary(cancer_data)

# Split the dataset into training and testing sets
set.seed(123)  # For reproducibility
train_index <- createDataPartition(cancer_data$Diagnosis, p = 0.8, list = FALSE)
train_data <- cancer_data[train_index, ]
test_data <- cancer_data[-train_index, ]

# Fit a logistic regression model
logistic_model <- glm(Diagnosis ~ ., data = train_data, family = "binomial")

# Summary of the model
summary(logistic_model)

# Predict on the test set
predicted_probs <- predict(logistic_model, newdata = test_data, type = "response")
predicted_classes <- ifelse(predicted_probs > 0.5, 1, 0)

# Evaluate the model
conf_matrix <- confusionMatrix(as.factor(predicted_classes), test_data$Diagnosis)
print(conf_matrix)

# Visualize important features (Optional)
library(ggplot2)
feature_importance <- broom::tidy(logistic_model) %>%
  filter(term != "(Intercept)") %>%
  arrange(desc(abs(estimate)))

ggplot(feature_importance, aes(x = reorder(term, estimate), y = estimate)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Feature Importance in Logistic Regression Model",
       x = "Features", y = "Coefficients")
