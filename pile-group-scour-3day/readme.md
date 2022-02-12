# PileGroup-MARS-3day
the multiple adaptive regression splines (MARS) method applied to pile group scour data for data having durations of 3days using package 'earth' in R software.<br />

created: March 2019

About:
the multiple adaptive regression splines (MARS) method applied to pile group scour data for data having durations of 3days

The data are non-dimensionalized: <br />
inputs = `x1, x2, x3, x4`;
output = `z`

    x1=m
    x2=n
    x3=S'm/bp
    x4=S'n/bp
    z=be/(Ks*W)

`m`=number of piles inline with the flow <br />
`n`=number of piles perpendicular to the flow <br />
`bp`=pile diameter or width <br />
`Sm` & `Sn`=pile spacing inline and perpendicular with the flow <br />
`S'm=bp` if `m=1`, otherwise `S'm=Sm` <br />
`S'n=bp` if `n=1`, otherwise `S'n=Sn` <br />
`Ks`=shape factor=1.0 for group of cylinders, 1.1 for group of square piles <br />
`W=n*bp`=projected width of piles <br />
`be`=equivalent width of pile group, back-calculated from `y_s` (scour depth) values using FDOT-2010 equations <br />

If we denote `S'n/bp` & `S'm/bp` by `Sn` & `Sm`, then the MARS formula is: <br />

       Z = 0.5639617 + 88.29669 * Max(0, tanh(m) - 0.9950548) - 0.8056905 * Max(0, 0.9640276 - tanh(n)) 
       - 23.86009 * Max(0, tanh(Sm) - 0.9950548) + 3.399566 * Max(0, 0.9640276 - tanh(Sn)) 
       - 4.202132 * Max(0, tanh(Sn) - 0.9640276)

and the linear alternative is: <br />

    Z = 0.84 * m ^ 0.43 * n ^ -0.06 * Sm ^ -0.06 * Sn ^ -0.55
