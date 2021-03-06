% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/classification.R
\name{privateEC}
\alias{privateEC}
\title{Private Evaporative Cooling feature selection and classification}
\usage{
privateEC(train.ds = NULL, holdout.ds = NULL, validation.ds = NULL,
  label = "class", method.model = "classification",
  is.simulated = TRUE, bias = 0.4, update.freq = 5,
  importance.name = "relieff", importance.algorithm = "ReliefFequalK",
  relief.k.method = "k_half_sigma", learner.name = "randomforest",
  xgb.obj = "binary:logistic", use.nestedCV = FALSE,
  ncv_folds = c(10, 10), learner.cv = NULL, rf.mtry = NULL,
  rf.ntree = 500, xgb.num.rounds = c(1), xgb.max.depth = c(4),
  xgb.shrinkage = c(1), start.temp = 0.1, final.temp = 1e-05,
  tau.param = 100, threshold = 4/sqrt(nrow(train.ds)),
  tolerance = 1/sqrt(nrow(train.ds)), signal.names = NULL,
  save.file = NULL, verbose = FALSE)
}
\arguments{
\item{train.ds}{A data frame with training data and outcome labels}

\item{holdout.ds}{A data frame with holdout data and outcome labels}

\item{validation.ds}{A data frame with validation data and outcome labels}

\item{label}{A character vector of the outcome variable column name.}

\item{method.model}{Column name of outcome variable (string), classification or regression. If the analysis goal is classification make the column a factor type.
For regression, make outcome column numeric type.}

\item{is.simulated}{Is the data simulated (or real?)}

\item{bias}{A numeric for effect size in simulated signal variables}

\item{update.freq}{An integer the number of steps before update}

\item{importance.name}{A character vector containg the importance algorithm name}

\item{importance.algorithm}{A character vestor containing a specific importance algorithm subtype}

\item{relief.k.method}{A character of numeric to indicate number of nearest neighbors for relief algorithm.
Possible characters are: k_half_sigma (floor((num.samp-1)*0.154)), m6 (floor(num.samp/6)),
myopic (floor((num.samp-1)/2)), and m4 (floor(num.samp/4))}

\item{learner.name}{A character vector containg the learner algorithm name}

\item{xgb.obj}{A character vector containing the XGBoost ojective function name}

\item{use.nestedCV}{A logic character indicating whether use nested cross validation or not}

\item{ncv_folds}{A vector of integers fo the number of nested cross validation folds}

\item{learner.cv}{An integer for the number of cross validation folds}

\item{rf.mtry}{An integer for the number of variables used for node splits}

\item{rf.ntree}{An integer the number of trees in the random forest}

\item{xgb.num.rounds}{= A vector of integers for xgboost algorithm iterations}

\item{xgb.max.depth}{A vector of integers for the xboost maximum tree depth}

\item{xgb.shrinkage}{= A vector of numerics for xgboost shrinkage values 0-1}

\item{start.temp}{A numeric EC starting temperature}

\item{final.temp}{A numeric EC final temperature}

\item{tau.param}{A numeric tau to control temperature reduction schedule}

\item{threshold}{A numeric, default 4 / sqrt(n) suggested in the
thresholdout’s supplementary material (Dwork, et al.,2015)}

\item{tolerance}{A numeric, default 1 / sqrt(n) suggested in the
thresholdout’s supplementary material (Dwork, et al.,2015)}

\item{signal.names}{A character vector of signal names in simulated data}

\item{save.file}{A character vector for results filename or NULL to skip}

\item{verbose}{A flag indicating whether verbose output be sent to stdout}
}
\value{
A list with:
\describe{
  \item{algo.acc}{data frame of results, a row for each update}
  \item{ggplot.data}{melted results data frame for plotting with ggplot}
  \item{correct}{number of variables detected correctly in each data set}
  \item{atts.remain}{name of the attributes in each iteraction}
  \item{ncv.atts}{name of the selected attributes using nested cross validation}
  \item{elapsed}{total elapsed time}
}
}
\description{
Private Evaporative Cooling feature selection and classification
}
\note{
Within thresholdout, we choose a threshold of 4 / sqrt(n) and
tolerance of 1 / sqrt(n) as suggested in the thresholdout’s supplementary
material (Dwork, et al., 2015).
}
\examples{
num.samples <- 100
num.variables <- 100
pct.signals <- 0.1
label <- "class"
sim.data <- createSimulation(num.samples = num.samples,
                             num.variables = num.variables,
                             pct.signals = pct.signals,
                             label = label,
                             pct.train = 1 / 3,
                             pct.holdout = 1 / 3,
                             pct.validation = 1 /3,
                             sim.type = "mainEffect",
                             verbose = FALSE)
pec.results <- privateEC(train.ds = sim.data$train,
                         holdout.ds = sim.data$holdout,
                         validation.ds = sim.data$validation,
                         label = sim.data$label,
                         is.simulated = TRUE,
                         importance.name = "relieff",
                         learner.name = "randomforest",
                         signal.names = sim.data$signal.names,
                         verbose = FALSE)
pec.results <- privateEC(train.ds = sim.data$train,
                         holdout.ds = sim.data$holdout,
                         validation.ds = sim.data$validation,
                         label = sim.data$label,
                         is.simulated = TRUE,
                         learner.name = "xgboost",
                         xgb.max.depth = 5,
                         signal.names = sim.data$signal.names,
                         verbose = FALSE)
}
\references{
Trang Le, W. K. Simmons, M. Misaki, B.C. White, J. Savitz, J. Bodurka,
and B. A. McKinney. “Differential privacy-based Evaporative Cooling feature selection
and classification with Relief-F and Random Forests,”
Bioinformatics. Accepted. \url{https://doi.org/10.1093/bioinformatics/btx298}. 2017

For more information see:
\href{http://insilico.utulsa.edu/index.php/privateec/}{Insilico Lab privateEC Page}
}
\seealso{
Other classification: \code{\link{epistasisRank}},
  \code{\link{getImportanceScores}},
  \code{\link{originalThresholdout}},
  \code{\link{privateRF}}, \code{\link{standardRF}},
  \code{\link{xgboostRF}}
}
\concept{classification}
