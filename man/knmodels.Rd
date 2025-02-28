%%
%% WARNING! DO NOT EDIT!
%% This file is automatically generated from knmodels.R
%%
 \name{inla.knmodels}
 \alias{inla.knmodels}
 \alias{knmodels}
 \title{Spacetime interaction models}
 \description{
    It implements the models in Knorr-Held, L. (2000) 
    with three different constraint approaches: 
    sum-to-zero, contrast or diagonal add.
 } 
 \usage{
inla.knmodels(
 formula,
 data,
 progress=FALSE, 
 control.st=list(
   t=NULL, 
   s=NULL,
   st=NULL,
   graph=NULL,
   type=c(paste(1:4), paste0(2:4, 'c'), paste0(2:4, 'd')), 
   diagonal=1e-5, 
   ...) 
 )
}
 \arguments{
 \item{formula}{The formula specifying the other 
   model components, without the spacetime 
   interaction term. The spacetime interaction term 
   will be added accordly to the specification in 
   the \code{control.st} argument. See \code{inla}}
 \item{progress}{If it is to be shown the model 
   fitting progress. Useful if more than one 
   interaction type is being fitted.}
 \item{control.st}{Named list of arguments to control
   the spacetime interaction. It should contains: 
  \code{time} to be used as the index set for the
   main temporal effect which will be considered
   for the constraints when it is the case.
  \code{space} to be used as the index set for the
   main spatial effect which will be considered
   for the constraints when it is the case.
  \code{spacetime} to be the index set for the
   spacetime interaction effect.
 \code{graph} to be the graph for the spatial neighbor 
   structure to be used in a \code{\link{f}} term 
   for the main spatial random effect term or for 
   building the spacetime interaction model.
 \code{type} to specify the spacetime interaction type.  
   \code{1} to \code{4} corresponds to the four 
   interaction types in Knorr-Held, L. (2000) with 
   all the needed sum-to-zero constraints. 
   \code{2c}, \code{3c} and \code{4c} are 
   the contrast version considering the first time  
   or space constrained to be equal to zero. 
   \code{2d}, \code{3d} and \code{4d} are the 
   corresponding versions when considering the 
   diagonal add approach.  
 \code{diagonal} to be the value to be added to the 
   diagonal when using the diagonal add approach.
 \code{timeref} to specify the time point to be the
   reference time in the contrast parametrization.
 \item{spaceref} to specify the area to be the
   reference for the contrast parametrization.
  \code{...} where additional arguments can be 
   passed to \code{\link{f}} function.
   Specification of the hyperparameter, 
   fixed or random, initial value, prior and its 
   parameters for the spacetime interaction. See 
   \code{?inla.models} and look for \code{generic0}. 
   By default we scale it and use the PC-prior to set 
   the prior using the \code{pc.prec} prior with 
   \code{param = c(0.5, 0.5)}. See documentation with 
   \code{?inla.doc("pc.prec")}.
 \item{...}{Arguments to be passed to the 
   \code{\link{inla}} function.}
 }
}
 \value{
  \code{inla.knmodels} returns an object of class \code{"inla"}. 
    or a list of objects of this class if it is asked to compute 
    more than one interaction type at once. 
 Note: when the model type is 2c, 3c, 4c, 2d, 3d or 4d, it also 
   includes linear combinations summary.
 }
 \author{Elias T. Krainski}
 \seealso{
     \code{\link{inla.knmodels.sample}} to sample from
 }
 \examples{
### define space domain as a grid
grid <- SpatialGrid(GridTopology(c(0,0), c(1, 1), c(4, 5)))
(n <- nrow(xy <- coordinates(grid)))

### build a spatial neighborhood list
jj <- lapply(1:n, function(i) 
    which(sqrt((xy[i,1]-xy[,1])^2 + (xy[i,2]-xy[,2])^2)==1))

### build the spatial adjacency matrix
graph <- sparseMatrix(rep(1:n, sapply(jj, length)),
                      unlist(jj), x=1, dims=c(n, n))

### some random data at 10 time points
dat <- inla.knmodels.sample(graph, m=10, tau.t=2, tau.s=2, tau.st=3)
str(dat)
sapply(dat$x, summary)

nd <- length(dat$x$eta)
dat$e <- runif(nd, 0.9, 1.1)*rgamma(n, 40, 2)
dat$y <- rpois(nd, dat$e*exp(dat$x$eta-3))
summary(dat$y)

### fit the type 4 considering three different approaches 
tgraph <- sparseMatrix(i=c(2:10, 1:9), j=c(1:9, 2:10), x=-1)
res <- inla.knmodels(y ~ f(time, model='bym2', graph=tgraph) +
     f(space, model='bym2', graph=graph),
     data=dat, family='poisson', E=dat$E, progress=TRUE, 
     control.st=list(time=time, space=space, 
        spacetime=spacetime, graph=graph, type=c(4, '4c', '4d')), 
     control.compute=list(dic=TRUE, waic=TRUE, cpo=TRUE))
sapply(res, function(x)
       c(dic=x$dic$dic, waic=x$waic$waic, cpo=-sum(log(x$cpo$cpo))))
}
