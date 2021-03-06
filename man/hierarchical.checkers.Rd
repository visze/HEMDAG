% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph.utility.R
\name{hierarchical.checkers}
\alias{hierarchical.checkers}
\alias{check.hierarchy.single.sample}
\alias{check.hierarchy}
\alias{check.hierarchy}
\title{Hierarchical constraints cheker}
\usage{
check.hierarchy.single.sample(y.hier, g, root = "00")

check.hierarchy(S.hier, g, root = "00")
}
\arguments{
\item{y.hier}{vector of scores relative to a single example. This must be a named numeric vector}

\item{g}{a graph of class \code{graphNEL}. It represents the hierarchy of the classes}

\item{root}{name of the class that it is the top-level (root) of the hierarchy (\code{def:00})}

\item{S.hier}{the matrix with the scores of the classes corrected in according to hierarchy. This must be a named matrix: rows are
examples and colums are classes}
}
\value{
return a list of 3 elements:
\itemize{
 \item Status: 
 \itemize{
  \item OK if none hierarchical constraints have bee broken;
  \item NOTOK if there is at least one hierarchical constraints broken;
  }
	\item Hierarchy_Constraints_Broken:
 \itemize{
  \item TRUE: example did not respect the hierarchical constraints; 
  \item FALSE: example broke the hierarchical constraints;
  }
 \item Hierarchy_costraints_satisfied: how many terms satisfied the hierarchical constraint
}
}
\description{
Check if the true path rule is violated or not. In other words this function checks if the score of a 
parent or an ancestor node is always larger or equal than that of its children or descendants nodes
}
\examples{
data(graph);
data(scores);
root <- root.node(g);
S.hier <- htd(S,g,root);
S.hier.single.example <- S.hier[sample(ncol(S.hier),1),];
check.hierarchy.single.sample(S.hier.single.example, g, root=root);
check.hierarchy(S.hier, g, root);
}
