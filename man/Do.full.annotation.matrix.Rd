% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/graph.utility.R
\name{Do.full.annotation.matrix}
\alias{Do.full.annotation.matrix}
\title{Do full annotations matrix}
\usage{
Do.full.annotation.matrix(anc.file.name = anc.file.name, anc.dir = anc.dir,
  net.file = net.file, net.dir = net.dir, ann.file.name = ann.file.name,
  ann.dir = ann.dir, output.name = output.name, output.dir = output.dir)
}
\arguments{
\item{anc.file.name}{name of the file containg the list for each node the list of all its ancestor (without \code{rda} extension)}

\item{anc.dir}{relative path to directory where the ancestor file is stored}

\item{net.file}{name of the file containing the weighted adjiacency matrix of the graph (without \code{rda} extension)}

\item{net.dir}{relative path to directory where the weighted adjiacency matrix is stored}

\item{ann.file.name}{name of the file containing the matrix of the most specific annotations (without \code{rda} extension)}

\item{ann.dir}{relative path to directory where the matrix of the most specific annotation is stored}

\item{output.name}{name of the output file without rda extension (without \code{rda} extension)}

\item{output.dir}{relative path to directory where the output file must be stored}
}
\value{
a full annotation matrix T, that is a matrix in which the transitive closure of annotations was performed.
Rows correspond to genes of the input weighted adjiacency matrix and columns to terms. 
\eqn{T[i,j]=1} means that gene \eqn{i} is annotated for the term \eqn{j}, \eqn{T[i,j]=0} means that gene \eqn{i} is not annotated for the term \eqn{j}.
}
\description{
High-level function to obtain a full annotation matrix, that is a matrix in which the transitive closure of annotations was performed, 
respect to a given weighted adiacency matrix
}
\examples{
data(graph);
data(labels);
data(wadj);
if (!dir.exists("data")){
	dir.create("data");
}
if (!dir.exists("results")){
	dir.create("results");
}
anc <- build.ancestors(g);
save(anc,file="data/ancestors.rda");
save(g,file="data/graph.rda");
save(L,file="data/labels.rda");
save(W,file="data/wadj.rda");
anc.dir <- net.dir <- ann.dir <- "data/";
output.dir <- "results/";
anc.file.name <- "ancestors";
net.file <- "wadj";
ann.file.name <- "labels";
output.name <- "full.ann.matrix";
Do.full.annotation.matrix(anc.file.name=anc.file.name, anc.dir=anc.dir, net.file=net.file, 
net.dir=net.dir, ann.file.name=ann.file.name, ann.dir=ann.dir, output.name=output.name, 
	output.dir=output.dir);
}
\seealso{
\code{\link{full.annotation.matrix}}
}
