% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_stratified_coef_w_ci.R
\name{plot_stratified_coef_w_ci}
\alias{plot_stratified_coef_w_ci}
\title{Create a Stratified Coefficient Plot with Confidence Intervals}
\usage{
plot_stratified_coef_w_ci(
  data,
  var,
  strata,
  coef,
  lower,
  upper,
  fill_color,
  xlab,
  pvalue = NULL
)
}
\arguments{
\item{data}{A data.frame in "long" format that contains columns denoting the names
of the tested variables (\code{var}), groups tested (\code{strata}), coefficients
(\code{coef}), and the lower (\code{lower}) and upper (\code{upper}) limits of
the coefficient confidence interval. Optionally, it can also contain p-values
(\code{pvalue}) for each coefficient.}

\item{var}{Character string. The column in \code{data} denoting names of tested
variables to be plotted on the y-axis. The plot will be faceted by this variable.}

\item{strata}{Character string. The name of the categorical variable in \code{data}
to stratify by, displayed as different color points and ranges.}

\item{coef}{Character string. The column in \code{data} denoting the estimated
coefficients for each stratum of \code{strata} and variable of \code{var}.}

\item{lower}{Character string. The column in \code{data} denoting the lower limit
of the confidence interval for each coefficient.}

\item{upper}{Character string. The column in \code{data} denoting the upper limit
of the confidence interval for each coefficient.}

\item{fill_color}{Named character vector or character vector. Color specification
for the points and ranges. Can be a named vector mapping variable categories to
colors, or a character vector of colors.}

\item{xlab}{Character string. The title for the x-axis describing the coefficients
being plotted.}

\item{pvalue}{Character string, optional. The column in \code{data} denoting the
p-values for each coefficient. If provided, p-values will be displayed as text
labels on the plot. If not provided, no p-values will be displayed.}
}
\value{
A ggplot object containing the coefficient plot with:
\itemize{
\item Coefficients displayed as points with error bars representing confidence
intervals
\item Faceted by variable for multiple comparisons
\item A vertical dashed line at x=0 for reference
\item P-values displayed as text labels on the plot if provided
}
}
\description{
Creates a coefficient plot showing the estimated coefficients and confidence
intervals of a numerical variable across different strata.
}
\details{
The function expects data in long format where each row represents one
coefficient estimate. Both \code{var} and \code{strata} variables are converted
to factors if they are not already. All coefficient-related columns (\code{coef},
\code{lower}, \code{upper}, and optionally \code{pvalue}) must be numeric.
}
\examples{
# Create sample coefficient data
set.seed(123)
coef_data <- data.frame(
  variable = rep(c("Age", "BMI", "Blood Pressure"), each = 3),
  group = rep(c("Treatment A", "Treatment B", "Control"), 3),
  estimate = c(0.15, 0.22, 0.08, -0.05, 0.12, 0.03, 0.25, 0.18, 0.10),
  ci_lower = c(0.05, 0.10, -0.02, -0.15, 0.02, -0.07, 0.15, 0.08, 0.00),
  ci_upper = c(0.25, 0.34, 0.18, 0.05, 0.22, 0.13, 0.35, 0.28, 0.20),
  p_value = c(0.003, 0.001, 0.12, 0.45, 0.02, 0.68, 0.0001, 0.001, 0.05)
)

# Basic usage without p-values
p1 <- plot_stratified_coef_w_ci(
  data = coef_data,
  var = "variable",
  strata = "group",
  coef = "estimate",
  lower = "ci_lower",
  upper = "ci_upper",
  fill_color = c("Treatment A" = "blue", "Treatment B" = "red", "Control" = "gray"),
  xlab = "Effect Size (95\% CI)"
)
print(p1)

# With p-values displayed
p2 <- plot_stratified_coef_w_ci(
  data = coef_data,
  var = "variable",
  strata = "group",
  coef = "estimate",
  lower = "ci_lower",
  upper = "ci_upper",
  fill_color = c("lightblue", "lightcoral", "lightgray"),
  xlab = "Standardized Coefficient",
  pvalue = "p_value"
)
print(p2)

}
