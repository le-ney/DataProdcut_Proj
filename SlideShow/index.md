Height Calculator
========================================================
author: 
date: 

Developing Data Products Course Project

What is Height Calculator
========================================================

It is a children's adult height prediction calculator based on the linear regression analysis method using the Galton's data set. You can access the tool by clicking on this [link](http://leney.shinyapps.io/DataProdcut_Proj/).  

Here are a few main features of our tool:

- Easy to use no training needed it
- Intutive graphical interface
- Highly interactive tool
- Graph to provide more insight into the formula

In the next few slides I will explain how it works

========================================================
#### **Galton's Data Set**
It is a cross-tabulation of 928 adult children born to 205 fathers and mothers, by their height and their mid-parent's height. Parent field is average of father and mother.




```r
summary(galton)
```

```
     child          parent    
 Min.   :61.7   Min.   :64.0  
 1st Qu.:66.2   1st Qu.:67.5  
 Median :68.2   Median :68.5  
 Mean   :68.1   Mean   :68.3  
 3rd Qu.:70.2   3rd Qu.:69.5  
 Max.   :73.7   Max.   :73.0  
```

========================================================
#### **Regression Model**

We use the lm function to build our regression model. Where parent is the explanatory variable and child is the response variable.


```r
Model <- lm(child ~ parent, data=galton)
coef(Model)
```

```
(Intercept)      parent 
    23.9415      0.6463 
```
In the code above the Model holds two variables including the coefficients of our linear model , an intercept and slope with values of 23.94 and 0.64 respectively. This implies a one inch increase in parent-mid height leads to 0.64 increase in child's height.

========================================================
#### **Visualization**

To save space I will just focus on code without executing it. To view the actual plot please use the tool. For visualization we have used ggplot2 which is a rich plotting system. The plot consists of  five main layers: scattered plot, regression line, confidence band, prediction band and prediction point.


```r
p <- ggplot(galton_with_pred, aes(x=parent, y=child)) + geom_point() +
        geom_smooth(method='lm', .....) +
        geom_ribbon(aes(y=fit, ....) +
        scale_fill_manual('Interval',...)+
p + geom_point(data=dat,colour="red",size=6)
.....  
```
For complete code please visit my [Github](https://github.com/le-ney/DataProdcut_Proj) account
