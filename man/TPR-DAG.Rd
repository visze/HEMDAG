% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tpr.R
\name{TPR-DAG}
\alias{TPR-DAG}
\alias{tpr.threshold}
\alias{tpr.threshold.free}
\alias{tpr.weighted.threshold.free}
\alias{tpr.weighted.threshold}
\title{TPR-DAG variants}
\usage{
tpr.threshold(S, g, root = "00", t = 0.5)

tpr.threshold.free(S, g, root = "00")

tpr.weighted.threshold.free(S, g, root = "00", w = 0.5)

tpr.weighted.threshold(S, g, root = "00", t = 0.5, w = 0.5)
}
\arguments{
\item{S}{a named flat scores matrix with examples on rows and classes on columns}

\item{g}{a graph of class \code{graphNEL}. It represents the hierarchy of the classes}

\item{root}{name of the class that it is on the top-level of the hierarchy (def. \code{root="00"})}

\item{t}{threshold for the choice of positive children (def. \code{t=0.5})}

\item{w}{weight to balance between the contribution of the node \eqn{i} and that of its positive children}
}
\value{
a named matrix with the scores of the classes corrected according to the TPR-DAG algorithm.
}
\description{
Different variants of the TPR-DAG algorithm are implemented. In their more general form the TPR-DAG algorithms adopt
a two step learnig strategy:
\enumerate{
\item in the first step they compute a \emph{per-level bottom-up} visit from the leaves to the root to propagate positive predictions across the hierarchy;
\item in the second step they compute a \emph{per-level top-down} visit from the root to the leaves in order to assure the hierarchical 
	consistency of the predictions
}
}
\details{
The \emph{vanilla} TPR-DAG adopts a per-level bottom-up traversal of the DAG to correct the flat predictions \eqn{\hat{y}_i}:
\deqn{
	\bar{y}_i := \frac{1}{1 + |\phi_i|} (\hat{y}_i + \sum_{j \in \phi_i} \bar{y}_j)
}
where \eqn{\phi_i} are the positive children of \eqn{i}.
Different strategies to select the positive children \eqn{\phi_i} can be applied:
\enumerate{
	\item \strong{Threshold-Free} strategy: the positive nodes are those children that can increment the score of the node \eqn{i}, that is those nodes 
	that achieve a score higher than that of their parents:
	\deqn{
		\phi_i := \{ j \in child(i) | \bar{y}_j > \hat{y}_i \}
	}
	\item \strong{Threshold} strategy: the positive children are selected on the basis of a threshold that can ben selected in two different ways:
	\enumerate{
		\item for each node a constant threshold \eqn{\bar{t}} is a priori selected:
	\deqn{
		\phi_i := \{ j \in child(i) | \bar{y}_j > \bar{t} \}
	}
		For instance if the predictions represent probabilities it could be meaningful to a priori select \eqn{\bar{t}=0.5}.
		\item the threshold is selected to maximize some performance metric \eqn{\mathcal{M}} estimated on the training data, as for instance
		the F-score or the AUPRC. In other words the threshold is selected to maximize some measure of accuracy of the predictions 
		\eqn{\mathcal{M}(j,t)} on the training data for the class \eqn{j} with respect to the threshold \eqn{t}. 
		The corresponding set of positives \eqn{\forall i \in V} is:
		\deqn{
			\phi_i := \{ j \in child(i) | \bar{y}_j > t_j^*,  t_j^* = \arg \max_{t} \mathcal{M}(j,t) \}
		}
		For instance \eqn{t_j^*} can be selected from a set of \eqn{t \in (0,1)} through internal cross-validation techniques.
}
}
The weighted TPR-DAG version can be designed by adding a weight \eqn{w \in [0,1]} to balance between the 
contribution of the node \eqn{i} and that of its positive children \eqn{\phi}, through their convex combination:
\deqn{
	\bar{y}_i := w \hat{y}_i + \frac{(1 - w)}{|\phi_i|} \sum_{j \in \phi_i} \bar{y}_j
}
If \eqn{w=1} no weight is attributed to the children and the TPR-DAG reduces to the HTD-DAG algorithm, since in this
way only the prediction for node \eqn{i} is used in the bottom-up step of the algorithm. If \eqn{w=0} only the predictors 
associated to the children nodes vote to predict node \eqn{i}. In the intermediate cases we attribute more importance to the predictor for the
node \eqn{i} or to its children depending on the values of \eqn{w}.
}
\examples{
data(graph);
data(scores);
data(labels);
root <- root.node(g);
S.tprTF <- tpr.threshold.free(S,g,root);
S.tprT <- tpr.threshold(S,g,root,t=0.5);
S.tprW <- tpr.weighted.threshold.free(S,g,root,w=0.5);
S.tprWT <- tpr.weighted.threshold(S,g,root,w=0.5, t=0.5);
}
