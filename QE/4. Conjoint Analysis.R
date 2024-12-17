# Load the necessary library
library(conjoint)

# Define your design
experiment <- expand.grid(
  speed = c("8M", "1M", "0.128M"),
  install = c("30000", "50000", "90000"),
  equip = c("rent", "free", "buy"),
  mf = c("29000", "8000+cc", "39000")
)

design <- caFactorialDesign(data = experiment, type = "fractional", cards = 14)
code <- caEncodedDesign(design)

level <- c("8M", "1M", "0.128M", "30000", "50000", "90000", "rent", "free", "buy", "29000", "8000+cc", "39000")
# Create a data frame
level_df <- data.frame(levels = level)

y <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14)
# Create a data frame
y_df <- data.frame(rating = y)

#Checking dfs
design
code
level_df
y_df

# Merge horizontally using cbind()
merged_df <- cbind(design, y_df)

# Save the merged data frame as a CSV file
write.csv(merged_df, file = "/Users/steven/Desktop/CA-test_1.csv", row.names = FALSE)

# Run Conjoint Analysis
Conjoint(y_df, code, z=level_df)



