# Find data files
find data for: 
unsaturated soil
concrete (I already have)
scour
complex pier

# Model tree
I have been trying to limit the number of model tree outputs
the most simple way is to use `minInstances` to achieve this. For example if you have `N` data then set it to `N/3.5` if you want 3 groups (3.5 to allow some wiggle room). 
The default value is `minInstances=4` which is way too few, unaccptable. 

Notice that `M5 rules` is easier to implement because it quickly gives you the formulas. 
However, the model tree is easier to visualize. 

# Bagging
In weka you can select bagging. Then you select the sub model. For example the sub model can be simple `linear regression` or `M5Rules` or whatever. 
Bagging uses 10 cross validation folds. Maybe reduce it to 4. But maybe not, keep all the ten. It uses `random tree` as the default model though. I don't like it alot. 

# automatic model tree
Say you want to do this: `y=a*x^b for x<x0 & y=c*x^d for x>x0`. I wished there was a algorithm which searched different values to find the best place. Usually split in half, so the search space is not too big, just equal to the number of variables & the number of divisions. For example 3 parts (`N/3` each) or 2 parts (`N/2` each). 
