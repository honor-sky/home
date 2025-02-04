% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import_caret_imp.R
\name{import_caret_imp}
\alias{import_caret_imp}
\title{Import feature importance from CARET object to FItable object}
\usage{
import_caret_imp(caret.obj, FItable.obj)
}
\arguments{
\item{caret.obj}{A prediction model (Classification or regression)}

\item{FItable.obj}{Training dataset (data frame) that is used to building model}
}
\value{
[list] updated FItable object
}
\description{
Get feature importance from CART to FItable
}
\details{
THis function get feature importance made by 'filterVarImp' function in CARET package and
copy to FItable.
}
\examples{
library("FIG")
# for regression
data("Boston", package = "MASS")
model <- lm(medv ~ ., data = Boston)
FIobj <- FItable(model, train=Boston, target.name="medv", grid=50,
                 task="regression", interaction_type="OH2")
print(FIobj)
FIgraph(gtype="S", FIobj=FIobj, task="regression", seed=101)

# get feature importance from CARET
myImp <- filterVarImp(x=Boston[,-14], y=Boston[,14])  #  14th column is 'mdev'
FIobj.new <- import_caret_imp(myImp, FIobj)
FIgraph(gtype="S", FIobj=FIobj.new, task="regression")

}
