Scatter plot smoothing is a tool used to visualize trends and compare relationships in bivariate data. The exploratory analysis is helpful in choosing regression models and checking assumptions. Running mean smooth is a method of scatter plot smoothing where an average is taken across a window of data points around a given x value. As the window scans across the x-axis, a non-parametric, functional fit or smooth is applied to the data. A running line smooth is when a linear relationship is fit to the data in the neighborhood (window) of x.  As the window scans across the x-axis there is a local linear model prediction for each value of x.  The size of the neighborhood or window will affect the smoothing of the fitted function and its bias-variance trade off. We will build an animation that illustrates the scatterplot smoothing algorithm for running mean and running line smooth, using a data set about world education.

## Specific Aims:
- Preprocess and understand the data
- Construct an animation to illustrate running mean and running line smooth
- Use the animation to highlight key aspects of scatterplot smoothing, like bandwidth
- Study the relationship between birth rate and primary school math proficiency for countries across the globe, and assess any trends

## The Dataset:
Data: https://www.kaggle.com/datasets/nelgiriyewithana/world-educational-data/data
### World Eeducational Dataset
- Insights into education: out-of-school rates, completion rates, birth rated, literacy rates and more
- Variables of interest: Math proficiency after the end of primary education and Birth Rate by Country
- Process data: Remove data entries with zero and we are left with 49 countries to analyze

## Broader impacts and Conclusions:

The running mean line indicates a trend where birth seems to decrease as math increases, especially after around 35 in the math scores.
Uses for Running Mean Smooth/Running Line Smooth include:
- Data Visualization: Helps in visualizing the underlying trend in the presence of noise.
- Outlier Identification: Assists in spotting outliers that deviate significantly from the running mean.
- Pattern Recognition: Useful in identifying patterns, especially non-linear ones, that might not be apparent with raw data.

Bandwidth in the context of a running mean smooth is the width of the window over which the means are computed.
A larger bandwidth will produce a smoother line, potentially obscuring local variations, whereas a smaller bandwidth will follow the data more closely, possibly highlighting noise as if it were a trend.

The optimal bandwidth minimizes error by balancing bias and variance. It's often chosen using cross-validation or other optimization techniques. We used R function dpill() to obtain the optimal bandwidth.

Bias refers to the error introduced by approximating a real-world problem, with a simpler model. If the bandwidth is too large, the model may be too simple and unable to capture the complexity of the data which is called underfitting.
Variance refers to the error from sensitivity to fluctuations in the training set. A smaller bandwidth may make the model too sensitive to noise which is called overfitting.

### Broader Impacts:
The running mean smooth provides a more interpretable representation of the data, which is critical for people who do not study statistics. Plus by highlighting the trends and patterns in the data, policymakers and practitioners can make more informed decisions about global education. 

In conclusion, the scatter plot with the running mean smooth suggests a potential inverse relationship between the math proficiency and birth rate variables. The chosen bandwidth of 5.3 seems to balance the trade-off between bias and variance well, as evidenced by the smoothness of the running mean line. While the running mean smooth indicates a trend, further statistical analysis like, correlation or regression analysis, is needed to understand the strength and significance of the relationship. 
