1) **Plan for Data Wrangling**  
* **Goals**: To wrangle the red and white wine datasets into one tidy dataframe where each row is a wine sample  
* **Needs:**  
- **Nouns:** red wine dataset, white wine dataset, RStudio, RProject, csv, white wine, red wine, residual sugar, citric acid, packages, tidyverse, dataframe.  
- **Verbs:** We will need to load necessary packages (tidyverse) and import the raw data. We will be using the rename and mutate functions within tidyverse to tidy each dataset, and the bind\_rows function will be used as well.  
- **Steps:**  
*  Finish the plan for wrangling the data  
* Create a new RProject  
* Open a blank RScript  
* Load necessary packages  
* Import the csv files for both the red and white wine datasets  
  * Separate each column with “;” as a delimiter  
  * Skip the first row when loading in the data to avoid having a row with all the column headers  
* Rename each column with a descriptive name  
* Use the mutate function to add a column named “color” in each dataframe  
  * Set the color equal to “red” for the red wine dataframe, and set the color equal to “white” for the white wine dataframe.  
* Use the bind\_rows function to join the two dataframes**.**

2) **Plan for Data Visualization**  
* **Goals:** To determine the effect of residual sugar and citric acid on wine quality in both red and white wines.  
* **Needs:**  
- **Nouns:** ggplot function, RStudio, wine dataset, the ggplot package, white wine, red wine, residual sugar, citric acid, labels, captions, title, alt text, long description, subtitle.  
- **Verbs:** access, add, load necessary packages, open, label axes, finish, write.  
- **Steps:**  
* Finish the plan for creating informative data visualizations  
* Open a blank RScript in the RProject for this assignment  
* Load necessary packages  
* Access the tidy wine data to create a line plot showing the effect of residual sugar and citric acid on wine quality  
  * Use the ggplot function to create a frame for the plot  
  * Set residual sugar as the independent variable of the plot, with quality being the dependent variable  
  * Color the data based on the wine’s color  
  * Add descriptive titles for the plot and axes  
  * Add a descriptive subtitle and caption  
  * Go through at least one round of polishing the plot  
* Repeat the previous step but with citric acid as the independent variable  
* Write clear and concise alt text for the plots  
* Add a detailed long description of the plot  
    
    
  