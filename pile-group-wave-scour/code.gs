function pier_wave_scour(KC,Fr_d) {
  var z=0;
  
  if (KC<=12){
    z = 1.36 * Math.pow(KC / 12 + 0.1,0.55 + -0.5 * KC / 12) * Math.pow(Fr_d / 14 + 0.1, 0.96);
  }
  else{
    z = 2.32 * Math.pow(KC / 30,0.83 + -0.14 * KC / 30) * Math.pow(Fr_d / 14 + 0.1, 0.53);
  }
  return (z);
  
  /*
    'z=ys/bp
    'KC=Um*T/bp
    'Fr_d=V/sqrt((SG-1)*g*d50)
    'V=current velocity
    'Um=orbital velocity of wave
    'T=wave period
    'bp = pier diameter
    'ys = scour depth
    'd50 = median sediment size
    'g=9.81
    'SG=2.65 for sand
    */
  
}


function pg_wave_scour(KC,Frd,Gbp,m,n) {
  var z=0;
  
  if (KC<=12){
    z =  2.43 * Math.pow(KC, 0.16) * Math.pow(Frd / 12 + 0.1, -0.41) * Math.pow(Gbp / 3 + 0.1, 0.2) * Math.pow(m / 4, 1.22) * Math.pow(n / 4, 1.34);
  }
  else{
    z = 0.69 * Math.pow(KC, 0.93) * Math.pow(Frd / 12 + 0.1, 0.91) * Math.pow(Gbp / 3 + 0.1, 0.73) * Math.pow(m / 4, -0.39) * Math.pow(n / 4, -0.097);
  }
  return (z);
  
  /*
    'z=ys/bp
    'G=clear spacing between piles
    'm=number of piles inline with the flow
    'n=number of piles perpendicular to the flow
    */
  
}