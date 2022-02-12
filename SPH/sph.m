#SPH B Spline Kernel Derivative accuracy


%%%octave m-file
%%octave is a programming language with syntax similar to matlab
%we looked at the following paper which uses SPH method
%%Ataie-Ashtiani, B., & Farhadi, L. (2006). A stable moving-particle semi-implicit method for free surface flows. Fluid dynamics research, 38(4), 241.
%for calculating gradient and laplacian operators, (?,?^2), basically they use a function which is dependent on the distance. 
%in essense, SPH requires calculating differentials on an irregular grid
%as a result, SPH is very much like finite difference, but the nodes are moving, and the derivatives are calculated on a nonuniform grid
%I tried a testing functions to check the accuracy of derivatives. I used regular mesh (but irregular mesh can be used too).
%the accuracy was O(1.6) for re=2*l0
%there are papers that deal with issue for various distances (r_e) and also both regular and irregular grids for obtaining the accuracy of calculating grad and laplacian. 
%in the paper, there are 6 kernel functions but we only tested the best
%which is w6 or the B-spline Kernel



##clc;
clear;

l0=.4;
L=12;
N=L/l0+1;
re=2*l0;

NN=N*N;
NN2=(N-4)^2;



%p=1,i=2,j=3,x=4,y=5,phi=6,phi_x_exact=7,phi_y_exact=8,laplace_calc=9,n=10,N=11
%phi_x_calc=12,phi_y_calc=13,laplace_calc=14
address_=zeros(NN,14);


jj=1;
f =  @(x,y)           +cos(jj*pi*x/L)*cosh(jj*pi*y/L);
fx = @(x,y) -(jj*pi/L)*sin(jj*pi*x/L)*cosh(jj*pi*y/L);
fy = @(x,y) +(jj*pi/L)*cos(jj*pi*x/L)*sinh(jj*pi*y/L);

for j=1:N
for i=1:N
  
    p=i+(j-1)*N;
    x=(i-1)*l0;
    y=(j-1)*l0;
    address_(p,1:5)=[p i j x y];
    %printf("%d %d %d\t\t",address_(p,1),address_(p,2),address_(p,3));
  endfor
endfor
 
for p=1:NN
  x=address_(p,4);
  y=address_(p,5);
  
  phi=f(x,y);
  phi_x=fx(x,y);
  phi_y=fy(x,y);
  
  address_(p,6)=phi;
  address_(p,7)=phi_x;
  address_(p,8)=phi_y;
  
endfor

for p=1:NN

  for pp=1:NN
    if p~=pp
      xp=address_(p,4);
      yp=address_(p,5);
      xpp=address_(pp,4);
      ypp=address_(pp,5);
      dist_=sqrt((xp-xpp)^2+(yp-ypp)^2);
      w=w6(dist_,re);
      address_(p,10)=address_(p,10)+w;
    endif
  endfor

endfor

clear p pp xp yp xpp ypp dist_ w i j x y ;

n0=max(address_(:,10));
d=2;

for p=1:NN
  i=address_(p,2);
  j=address_(p,3);
  if i>=3 && i<=N-2 && j>=3 && j<=N-2  
    for pp=1:NN
      if p~=pp
        xp=address_(p,4);
        yp=address_(p,5);
        xpp=address_(pp,4);
        ypp=address_(pp,5);
        dist_=sqrt((xpp-xp)^2+(ypp-yp)^2);
        r_x=xpp-xp;
        r_y=ypp-yp;
        dphi=address_(pp,6)-address_(p,6);
        w_pp=w6(dist_,re);
        lambda=31/196*re^2;
        
        grad_x_pp=d/n0*dphi/dist_^2*r_x*w_pp;
        grad_y_pp=d/n0*dphi/dist_^2*r_y*w_pp;
        laplace=2*d/(lambda*n0)*dphi*w_pp;
        
        address_(p,12)=address_(p,12)+grad_x_pp;
        address_(p,13)=address_(p,13)+grad_y_pp;
        address_(p,14)=address_(p,14)+laplace;
      endif
    endfor
  endif
  
endfor

clear p pp xp yp xpp ypp dist_ r_x r_y dphi w_pp grad_x_pp grad_y_pp laplace i j x y phi phi_x phi_y;



printf("\n");

##w6(l0,re);

 median(abs(address_(:,14)))
 
 address_new=zeros((N-4)^2,14);
 counter_=1;
 
 for p=1:NN
   i=address_(p,2);
   j=address_(p,3);
   if i>=3 && i<=N-2 && j>=3 && j<=N-2
     address_new(counter_,:)=address_(p,:);
     counter_=counter_+1;
   endif
 endfor

 
 err1=sqrt(sumsq(address_new(:,7)-address_new(:,12))/NN2);
 err2=sqrt(sumsq(address_new(:,8)-address_new(:,13))/NN2);
  err3=sqrt(sumsq(address_new(:,14))/NN2);
  
  printf("%f\t%f\t%f\t%f\n",l0,err1,err2,err3);
  
  
