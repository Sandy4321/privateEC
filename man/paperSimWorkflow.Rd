% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workflow.R
\name{paperSimWorkflow}
\alias{paperSimWorkflow}
\title{Workflow for running one simulation of the Bioinformatics paper workflow}
\usage{
paperSimWorkflow(n.samples = 100, n.variables = 100,
  pct.signals = 0.1, update.freq = 10, verbose = FALSE)
}
\arguments{
\item{n.samples}{An integer for the number of samples}

\item{n.variables}{An integer for the number of variables}

\item{pct.signals}{A numeric for the significant variable bias}

\item{update.freq}{A integer for the number of steps before update}

\item{verbose}{A flag indicating whether verbose output be sent to stdout}
}
\value{
A list containing:
\describe{
  \item{run.results}{data frame of run results of each sim type}
  \item{elapsed}{total elapsed time}
}
}
\description{
Creates one simulation of train/holdout/validation data sets, then runs the
four algorithms on that data. Returns a data frame of run results for each.
}
\note{
Default parameter values match those from the Bioinformatics paper.
}
\examples{
  num.samples <- 100
  num.variables <- 100
  pct.signals <- 0.1
  upd.frq <- 0.1 * num.variables
  one.step.result <- paperSimWorkflow(n.samples = num.samples,
                                      n.variables = num.variables,
                                      pct.signals = pct.signals,
                                      update.freq = upd.frq,
                                      verbose = FALSE)
}
\seealso{
The workflow consists of the sequence:
\code{\link{createSimulation}}
\code{\link{privateEC}}
\code{\link{originalThresholdout}}
\code{\link{privateRF}}
\code{\link{standardRF}} and
\code{\link{compileAndSaveAllResults}}. A comparison analysis with real data (fMRI)
is in \code{\link{paperRealWorkflow}}.

Other workflows: \code{\link{compileAndSaveAllResults}},
  \code{\link{paperRealWorkflow}},
  \code{\link{plotRunResults}}
}
\concept{workflows}
