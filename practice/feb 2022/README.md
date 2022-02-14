# re learning machine learning!!
Optimization with steepest descent &amp; finite difference (also Hessian calculation)

ideas for improvement: 
Basin-hopping is a global optimization technique that iterates by performing random perturbation of coordinates, performing local optimization, and accepting or rejecting new coordinates based on a minimized function value.

In mathematical optimization, a trust region is the subset of the region of the objective function that is approximated using a model function (often a quadratic). If an adequate model of the objective function is found within the trust region, then the region is expanded; conversely, if the approximation is poor, then the region is contracted. "trusted" only in the region where it provides a reasonable approximation.

SPH:
ε=sum(i,j) W(sum_k(bik-bjk)^2)
W=exp(-x^2)
dε/dbk = sum dW/dbk
therefore
dε/dbk = sum(i,j) * (-2*(bik-bjk) * W(sum_k(bik-bjk)^2) 

ε = error function
_b_ = parameter vector
_bk_ = _k_th parameter_ _ 
k = number of parameters
i,j = index of points
