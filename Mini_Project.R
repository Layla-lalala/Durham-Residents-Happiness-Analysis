UK <- read.csv("C:\\Users\\USER\\OneDrive\\桌面\\MDS\\Statistics\\Assignment\\GroupMiniProject\\UKContentment.csv")
install.packages("corrplot") 
install.packages("ggcorrplot")

# Extract the relevant variable

Influence_Decisions <- UK$Influence_Decisions
Get_On_Well <- UK$Get_On_Well
Belong <- UK$Belong
Drug_Issues <- UK$Drug_Use_And_Selling
Satisfaction <- UK$Overall

# Extract the area identifiers
Authority <- UK$Authority
Area <- UK$Area

# Create a data frame
data <- data.frame(
  Authority = Authority,
  Area = Area,
  Influence_Decisions = Influence_Decisions,
  Get_On_Well = Get_On_Well,
  Belong = Belong,
  Drug_Issues = Drug_Issues,
  Satisfaction = Satisfaction
)

# View the first few rows of the new data frame
head(data)

# Check the structure of the data frame
str(data)

# Summary of the data (e.g., means, min, max, etc.)
summary(data)

# Scatter plot and Confirm if the relationship is linear.
library(ggplot2)
ggplot(data, aes(x=Influence_Decisions, y=Satisfaction)) +
  geom_point() +
  geom_smooth(method = lm, formula = y~x, se = TRUE)


ggplot(data, aes(x=Get_On_Well, y=Satisfaction)) +
  geom_point() +
  geom_smooth(method = lm, formula = y~x, se = TRUE)


ggplot(data, aes(x=Belong, y=Satisfaction)) +
  geom_point() +
  geom_smooth(method = lm, formula = y~x, se = TRUE)


ggplot(data, aes(x=Drug_Issues, y=Satisfaction)) +
  geom_point() +
  geom_smooth(method = lm, formula = y~x, se = TRUE)

#Test type of distribution
shapiro.test(Influence_Decisions)
shapiro.test(Get_On_Well)
shapiro.test(Belong)
shapiro.test(Drug_Issues)
shapiro.test(Satisfaction)

qqnorm(Influence_Decisions)
qqline(Influence_Decisions, col = "red", lwd = 2)
hist(Influence_Decisions)


qqnorm(Get_On_Well)
qqline(Get_On_Well, col = "red", lwd = 2)

qqnorm(Belong)
qqline(Belong, col = "red", lwd = 2)

qqnorm(Drug_Issues)
qqline(Drug_Issues, col = "red", lwd = 2)

qqnorm(Satisfaction)
qqline(Satisfaction, col = "red", lwd = 2)


# Correlation data
data_subset <- data[, 3:ncol(data)]
library(corrplot)
cor_matrix <- cor(data_subset, method = "spearman")

corrplot(cor_matrix, type = "upper", method = "color", col = colorRampPalette(c("red", "white", "blue"))(200),
         addCoef.col = "black", tl.col = "red", tl.srt = 90, diag = FALSE,)




cor(Influence_Decisions,Satisfaction, method = "pearson")
cor(Influence_Decisions,Satisfaction, method = "spearman")
cor.test(Influence_Decisions,Satisfaction, method = "spearman", exact = FALSE)

cor(Get_On_Well,Satisfaction, method = "pearson")
cor(Get_On_Well,Satisfaction, method = "spearman")

cor(Belong,Satisfaction, method = "pearson")
cor(Belong,Satisfaction, method = "spearman")

cor(Drug_Issues,Satisfaction, method = "spearman")

