# Durham-Residents-Happiness-Analysis
A data analysis project using R to model factors influencing residents' happiness in Durham. Includes data cleaning, regression modelling (R² = 0.89), visualisation (ggplot2), and policy-oriented insights.


# Project Overview
This project utilizes survey data and statistical modeling methods to analyze the factors influencing the happiness of residents in Darlington, UK. The project aims to identify the key drivers that affect the overall life satisfaction of the residents and provide feasible insights for local decision-makers. We conducted a multiple linear regression analysis using the R language to establish a model for the relationship between residents' happiness and various community social factors. The final model achieved a high goodness-of-fit (R² ≈ 0.89), indicating it explains about 89% of the variance in the happiness index of Durham’s residents. This was a team project where we collaborated on data preparation, analysis, and reporting; notably, data cleaning, variable selection, and policy-oriented reporting were critical components of the work.


# Data Source & Variables
Data Source: The dataset contains survey results from various local government areas in England (including Durham County). Each record represents a local administrative area (city/region) and summarizes the aggregated results of the community happiness questionnaire. The dataset consists of 352 observation records and 7 variables. All numerical variables are percentages (0–100%), and they are converted to decimal proportions ranging from 0 to 1 before analysis. There are no missing values in the data. Apart from handling outliers and standardizing proportions, almost no additional cleaning is required. The main variables include：

Overall – Overall life satisfaction: the proportion of residents who reported being satisfied with living in their area (this is the target variable, representing “happiness”).

Influence_Decisions – The percentage of residents who feel they can influence decisions made in their local area (community involvement/empowerment).

Get_On_Well – The percentage of residents who believe people from different backgrounds get on well together in their community (social cohesion indicator).

Belong – The percentage of residents who feel they belong to their neighbourhood (sense of community belonging).

Drug_Use_And_Selling – The percentage of residents who consider drug use and/or drug selling to be a problem in the local area (community safety concern).

Area – A categorical variable indicating the region of England each authority is located in (e.g. North East, North West, Yorkshire and The Humber, etc.). There are 9 regions in total, which we later consolidated for modeling.


# Methodology & Model Building
We adopt the following structured approach to analyze the data and build a regression model: 

1. Data preprocessing:
All percentage values are standardized to decimals (divided by 100) to unify the scale. Box plots and Z-score methods are used to check for outliers. We separately constructed regression models including and excluding outliers for comparison; the results showed that although removing outliers slightly improved the normality of residuals, it would cause the model's R² to decrease by approximately 2%. Therefore, we decided to retain all data points to maximize the model's explanatory power. Since there are no missing values in the data, interpolation is not necessary. We set the administrative region names as indices, and during the analysis, we mainly focused on numerical and categorical variables.

2. Exploratory analysis:
Examine the relationship between each independent variable and the target variable. Since the normality test (Shapiro-Wilk) showed that most variables did not follow a normal distribution, we used the Spearman rank correlation coefficient to measure the correlation. The results indicated that except for the correlation between Influence_Decisions being relatively weak, all other independent variables had a moderate or higher degree of correlation with overall satisfaction. To further verify the linear relationship, we plotted scatter plots of each numerical independent variable against overall satisfaction. The scatter plots confirmed the approximately linear relationship: Belong and Get_On_Well showed a significant positive linear trend with satisfaction, Drug_Use_And_Selling showed a significant negative correlation with satisfaction, and Influence_Decisions showed a slight positive correlation. We also generated a correlation matrix heatmap to check for multicollinearity among the variables and drew histograms and box plots to observe the distribution patterns and potential outliers of each variable.

3. Regional factor analysis:
The "Area" variable has 9 categories. Using this variable directly in the regression would increase the complexity of the model. We evaluated the regional pattern by calculating the descriptive statistics of each region and drawing box plots of the overall satisfaction levels for each region. The results showed a significant north-south difference in happiness. To provide more local decision-making suggestions that are closer to the Durham County, we decided to focus on the data from the northern regions of England and establish a sub-model. The specific approach was to divide the regions into "Northern" and "Southern": the Northeast, Northwest, and Yorkshire-Humber were grouped as the "Northern" group (because the individual Northeast sample was smaller), and this model was used as the main analysis object, while the national model was only used as a reference.

4. Model Construction:
We built a multiple linear regression model using R’s lm() on the Northern subset (81 authorities from the three northern regions). The initial model included all candidate predictors: Influence_Decisions, Get_On_Well, Belong, Drug_Use_And_Selling, plus regional dummy variables. We performed variable selection (including best-subset selection) to refine the model. Results indicated that Influence_Decisions was the least significant predictor (p > 0.05) and that we could simplify regional dummies. We therefore consolidated region into a single dummy for Yorkshire & Humber (1 if in Yorkshire, 0 if in North East/West) and added an interaction term between Area(Yorkshire) and Get_On_Well to capture any regional difference in the effect of community cohesion. Despite its weaker contribution, we retained the Influence_Decisions variable for theoretical completeness (it had a plausible positive effect and excluding it barely changed R²). The final regression model was:

Overall_Satisfaction = 0.389 + 0.194 Influence_Decisions + 0.337 Get_On_Well + 0.336 Belong – 0.369 Drug_Use_And_Selling + 0.188 Area(Yorkshire) – 0.235 [Area(Yorkshire)×Get_On_Well].

Here Area(Yorkshire) is a dummy (1 if the authority is in Yorkshire and The Humber, 0 otherwise).

5. Model Evaluation:
The North Model showed excellent fit and statistically significant results. The adjusted R² was ~0.89, meaning the model explains ~89% of the variance in northern residents’ satisfaction. All predictors in the final model were significant at the 0.05 level (Influence_Decisions was borderline but included as noted). The overall F-test was highly significant (p < 2.2e-16), indicating the model is reliable. We rigorously checked regression assumptions:

Linearity: Residuals vs. Fitted plots showed no obvious patterns, indicating the linear form is appropriate.
Homoscedasticity: Residuals displayed constant variance (random scatter without funnel shape).
Normality: Residuals passed the Shapiro-Wilk normality test (p ≈ 0.87, approximately normal distribution) and Q-Q plot appeared roughly linear.
Independence: Residuals showed no significant autocorrelation (Durbin-Watson statistic and residual lag plot indicated independence).
Multicollinearity: Variance Inflation Factors (VIF) were all < 5, so no serious multicollinearity issues in the final model.


# Visualization
Throughout the entire analysis process, we created various visual charts to illustrate the data patterns and support our findings: 
Scatter plot
Correlation Heatmap
Regional Boxplot
Diagnostic Plots

# Skills & Tools Utilized 
This project highlights several data analysis skills and tools relevant to analytics roles:

1. Data Cleaning & Preprocessing:
Identified outliers, normalized data (percentage to proportion scaling), and ensured data quality (checked for missing values).

2. Exploratory Data Analysis (EDA):
Performed statistical tests (Shapiro-Wilk), computed correlations, and visualized distributions (histograms, boxplots) to understand data patterns.

3. Data Visualization:
Created insightful charts including scatter plots, correlation heatmaps, and boxplots using ggplot2 and other R libraries, to communicate relationships and findings effectively.

4. Statistical Modeling:
Built a multiple linear regression model using R, including model specification, interpreting coefficients, and quantifying goodness-of-fit (R², Adjusted R²).

5. Variable Selection & Feature Engineering:
Employed best-subset selection and domain reasoning to choose relevant predictors; engineered features to improve model explanatory power.

6. Model Evaluation & Validation:
Tested regression assumptions and checked multicollinearity (VIF) to validate model integrity; compared alternate models.

7. Reporting & Communication:
Summarized technical findings into policy-oriented reports and presentations. Translated data insights into clear recommendations for non-technical stakeholders.


# Business Implications
Through this analysis, we have provided the local government of Durham County and relevant stakeholders with policy-oriented insights to enhance the well-being of residents: 

Combatting drug-related issues: Given the significant negative impact of drug problems on people's well-being, reducing drug use and trafficking should be the top priority. The government should allocate resources to carry out comprehensive drug education and rehabilitation programs to help affected residents return to normal lives. At the same time, strengthening neighborhood patrols and community security can help combat drug crimes and enhance residents' sense of security. These measures are expected to eliminate one of the main factors that reduce the quality of life.

Promoting community cohesion: Given that social cohesion indicators (Get_On_Well and Belong) have a strongly positive impact on happiness, efforts should be made to build trust and connections among residents, which will significantly enhance overall satisfaction. Community leaders and the government can organize various activities, cultural exchanges, and volunteer projects to bring together residents from different backgrounds. Encouraging neighborly interactions and inclusive community projects can enhance understanding, friendship among residents, and increase their sense of belonging. 

Encouraging citizen participation: Although the impact is relatively small, providing residents with the opportunity to participate in local decision-making still helps to enhance happiness. Local governments can implement or expand mechanisms such as public forums, public opinion surveys, and participatory budgets, allowing residents to feel that their voices are heard and have an impact in shaping the community. Feeling involved and contributing will increase residents' satisfaction and sense of identity with local governance. 

Tailor policies according to local conditions: It is necessary to pay attention to the influence of regional and cultural factors on happiness. The model in Durham County is different from that in southern England, so policies should be tailored to local needs and advantages. For example, in the northern region, focusing on enhancing community cohesion and combating drug problems may have a better effect than national uniform measures. At the same time, it is recommended to continuously collect feedback and data and regularly monitor changes in community emotions. This dynamic adjustment strategy can ensure that policies remain effective as the social environment changes.
