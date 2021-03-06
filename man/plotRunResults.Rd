% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workflow.R
\name{plotRunResults}
\alias{plotRunResults}
\title{Plot the results of a privateEC workflow for a quick plot/review with base graphics.}
\usage{
plotRunResults(pec.result = NULL)
}
\arguments{
\item{pec.result}{A list representing the results returned from a privateEC algorithm run.}
}
\description{
Plot the results of a privateEC workflow for a quick plot/review with base graphics.
}
\examples{
data(rsfMRIcorrMDD)
# ~100 variables for a test
data.width <- ncol(rsfMRIcorrMDD)
real.data.sets <- splitDataset(all.data = rsfMRIcorrMDD[, (data.width - 101):data.width],
                               pct.train = 0.5,
                               pct.holdout = 0.5,
                               pct.validation = 0,
                               label = "class")
real.result <- privateEC(train.ds = real.data.sets$train,
                         holdout.ds = real.data.sets$holdout,
                         validation.ds = NULL,
                         label = "class",
                         is.simulated = FALSE,
                         update.freq = 5,
                         verbose = FALSE)
plotRunResults(real.result)
}
\seealso{
Other workflows: \code{\link{compileAndSaveAllResults}},
  \code{\link{paperRealWorkflow}},
  \code{\link{paperSimWorkflow}}
}
\concept{workflows}
