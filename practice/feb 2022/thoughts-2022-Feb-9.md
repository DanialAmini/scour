
# thoughts new:
** today **
* let's do some actual work! *
*** please do it dani! ***
`import numpy as np #our motto
nice & easy for making links [GitHub Pages](https://pages.github.com/)`

yhat=b0+b1*x1+b2*x2

ytube=b'0+b'1*x1+b'2*x2

y+-ytube

aim for 90% coverage... 
then make it 30% coverage... or whatever


you can also do it with alpha (elena celedoni, no the italian girl)


first obtain yhat

then train ytube

bayesian optimization::: train a model of models!!! tells you which direction to go!! 

this is diff from training models using random draw to obtain coefficient variations!!!! 

also I need something to tell me if a variable is needed or no!! maybe should employ remove it & check for error reduction thing!! make it modular!!

let's try these all in matlab as well

let's do hamid's work tonight as well!!!!

and let's do gomrokchi's work & get him off our back! fuck him!!!

we can plot things in a python notebook! much cleaner!

we will work with a few preview files!!! that's it!!!!

get some real datasets & work with them!!!










# thoughts old:
** yesterday **
* let's do some actual work! *
*** please do it dani! ***

bayesian optimization: 

you have some data points
fit guassian process (estimates both yhat + std) (or confidence bounds)
then calculate std
when new function evaluation is made, update the guassian process surrogate model
perform optimization using the surrogate model!! 
because we have a fixed number of pre-calculated function evaluations & we want to do what we can with that instead of new points!!! got it? 

this might be useful in genetic algorithm even!!


or we can use this:: 
calculate guasian process, calc std
compare with std of asymmetric loss function!!!
find the suitable value that mimics it!!!!
or bayesian ridge regression, calc std
also perform regression with random draw, calculate std for yhat!!!!

bayesian optimization can be used to fine tune : 
number of neurons
number of hidden layers
learning rate
Cost value C in SVM

this is a very good tutorial from Mr. Y. Natsume
https://towardsdatascience.com/bayesian-optimization-with-python-85c66df711ec
