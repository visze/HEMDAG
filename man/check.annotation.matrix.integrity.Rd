% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph.utility.R
\name{check.annotation.matrix.integrity}
\alias{check.annotation.matrix.integrity}
\title{Annotation matrix checker}
\usage{
check.annotation.matrix.integrity(anc, ann.spec, ann)
}
\arguments{
\item{anc}{list of the ancestors of the ontology.}

\item{ann.spec}{the annotation matrix of the most specific annotations (0/1): rows are genes and columns are terms.}

\item{ann}{the full annotations matrix (0/1), that is the matrix in which the transitive closure of the annotation was performed.
Rows are examples and columns are classes.}
}
\value{
If the transitive closure of the annotations is well performed "OK" is returned, otherwise a message error is printed on the stdout
}
\description{
This function assess the integrity of an annotation table in which a transitive closure of annotations was performed
}
\examples{
data(graph);
data(labels);
anc <- build.ancestors(g);
tca <- transitive.closure.annotations(L, anc);
check.annotation.matrix.integrity(anc, L, tca);
}
\seealso{
\code{\link{build.ancestors}}, \code{\link{transitive.closure.annotations}}, \code{\link{full.annotation.matrix}}
}
