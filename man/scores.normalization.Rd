% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/norm.fun.R
\name{scores.normalization}
\alias{scores.normalization}
\title{Scores Normalization Function}
\usage{
scores.normalization(norm.type = "MaxNorm", S)
}
\arguments{
\item{norm.type}{can be one of the following two values:
\itemize{
\item MaxNorm (\code{def.}): each score is divided w.r.t. the max of each class;
\item Qnorm: a quantile normalization is applied. Library preprocessCore is used.
}}

\item{S}{a named flat scores matrix with examples on rows and classes on columns}
}
\value{
the matrix of the scores flat normalized w.r.t. MaxNorm or Qnorm
}
\description{
Functions to normalize a flat scores matrix w.r.t. max normalization (MaxNorm) or quantile normalization (Qnorm)
}
\details{
To apply the quantile normalization the \pkg{preprocessCore} library is uded.
}
\examples{
data(scores);
norm.types <- c("MaxNorm","Qnorm");
for(norm.type in norm.types){
	scores.normalization(norm.type=norm.type, S=S)
}
}
