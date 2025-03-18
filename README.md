# Cats Dataset Dashboard

## Overview
This is a Shiny web application that provides an interactive dashboard for exploring a dataset of cat breeds. Users can filter the data by breed, gender, and color, and view visualizations of age and weight distributions.

## Features
- Interactive filtering of cat dataset by breed, gender, and color
- Histogram plots for age and weight distributions
- Data table displaying filtered results

## Prerequisites
Ensure you have R installed on your system. You also need the following R packages:

```r
install.packages(c("shiny", "shinydashboard", "ggplot2", "DT", "rsconnect"))
```

## Setup and Installation
1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/DSCI-532-Individual-cats.git
   ```
2. Navigate to the project directory:
   ```sh
   cd DSCI-532-Individual-cats
   ```
3. Open R or RStudio and set the working directory:
   ```r
   setwd("C:/path/to/DSCI-532-Individual-cats/src")
   ```
4. Run the application:
   ```r
   shiny::runApp()
   ```

## Project Structure
```
DSCI-532-Individual-cats/
│── data/
│   ├── cats_dataset.csv  # Dataset
│── src/
│   ├── app.r             # Shiny app script
│── README.md             # Project documentation
│── .gitignore            # Git ignore file
```

## Data Requirements
The dataset (`cats_dataset.csv`) should have the following columns:
- `Breed` (Character) – The breed of the cat
- `Age (Years)` (Numeric) – Age in years
- `Weight (kg)` (Numeric) – Weight in kilograms
- `Color` (Character) – Color of the cat
- `Gender` (Character) – Gender of the cat

Before running the app, column names will be sanitized to replace special characters with underscores.

## Troubleshooting
### Error: File Not Found (`cats_dataset.csv`)
Ensure that `cats_dataset.csv` is inside the `data/` folder. If necessary, update the file path in `app.r`.

### Error: Plot Not Displaying
If plots show errors, verify column names using:
```r
print(colnames(df))
```
Ensure `Age_Years` and `Weight_kg` exist and are numeric.

### Port Already in Use
If the app fails to start due to a port issue, try specifying a different port:
```r
shiny::runApp(port = 8080)
```

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

