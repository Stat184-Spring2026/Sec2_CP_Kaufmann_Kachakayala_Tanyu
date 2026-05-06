## Exploratory Data Analysis
### Introduction on the topic:
Wine is a very popular beverage enjoyed by many. Portugal is a top explorer of wine and that relates to this report because we will be analysing two types of wines originating from Portugal. The red and white vinho verde wine. To go into more detail, we will be analyzing how physiochemical properties such as the fixed acidity, volatile acidity, citric acid, residual sugar, chlorides, free sulfur dioxide, total sulfur dioxide, density, pH, sulphates, and alcohol which are the input variables, affects the quality of the wine which is the sensory output variable measured on a scale of 1-10 via taste testing. The sensory measurement was obtained by wine experts.

### Data Provenance:
#### Who Collected the Data: 
This Dataset was collected by 5 individuals named as follows: 
- Paulo Cortez 
- António Cerdeira 
- Fernando Almeida 
- Telmo Matos
- José Reis
#### What Data was collected: 
The data collected includes physio chemical measurements of wine such as pH of the wine and density of the wine and many others, along with a sensory output. This sensory output is wine taste and it was obtained from wine experts.
#### When was this Data collected: 
This Dataset was donated the the UCI machine learning repository on October 6th 2009.
#### Where the Data was collected: 
The dataset includes wine samples of the red and white vinho verde wine from the Minho region in Portugal.
#### Why the Data was collected:
The data was collected to analyze how chemical properties affect the perceived quality of the wine sample so decisions can be made to improve wine production.
#### How the Data was collected: 
The data was recorded by a computerized system which automatically managed the process of wine sample testing which includes laboratory and sensory analysis. Each entry denotes a given test and the final data was put into a csv file. During the preprocessing stage, the database was transformed in order to include a distinct wine sample per row, and to mishandling useful samples, only the most common physicochemical tests were selected. Since the red and white tastes are quite different, the analysis will be performed separately. And this made us have 1599 red and 4898 white samples.

This analysis uses data consistent with FAIR principles: The wine quality dataset is findable and accessible through the UCI Machine Learning Repository. The data is interoperable because it is given to us in a structured table format. The data is   reusable because the variables are documented and linked to the original study by Cortez et al. (2009).

By using the CARE principles, the researchers evaluated the data for Collective Benefit, Authority to Control, Responsibility besides Ethics. If the wine quality dataset is available to the public, the researchers still acted in a responsible manner. To do this they used the information only for education and research. As they worked they provided a citation for the original source. And they explained the results without claiming that one variable caused another in a way that is more certain than the evidence shows. It is important that this method enables the reuse of public data in an ethical way. On that account the researchers followed their duty to show the dataset in a way that is accurate and easy for others to see.
