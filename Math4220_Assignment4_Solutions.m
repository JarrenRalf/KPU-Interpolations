
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Math 4220 Fall 2018 
% Assignment 4 Solutions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% It is generally recommended to clear all previously defined
% variables from the workspace.
clear; 
clc;

% Toggle between problems

index=5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 4

if index == 4
    
   x=1:0.001:5;
   
   % exact on evaluation mesh
   ye=gamma(x); 
   
   xi=1:5;
   
   % Data
   yi=[1,1,2,6,24];
   
   % Polynomial Interpolation
   coef=divdif(xi,yi);
   yp=evalnewt(x,xi,coef);
   
   % Spline Interpolation
   ys=spline(xi,yi,x);
   
   figure(1)
   plot(x,ye,x,yp,x,ys);
   legend('exact','poly','spline');
   errs=norm(ys-ye,inf);
   figure(2)
   % Plot errors
   plot(x,ye-yp,x,ye-ys);
   legend('error poly','error spline');
   xlabel('x');
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 5

if index == 5
    
    xx=[0.1 0.15 0.2 0.3 0.35 0.5 0.75];
    yy=[3.0 2.0 1.2 2.1 2.0 2.5 2.5];
    
    % Polynomial Interpolant
    tab=divdif(xx,yy);
    x=0.05:0.01:0.8;
    y1=evalnewt(x,xx,tab);
    subplot(3,2,1)
    plot(x,y1)
    title('interpolating polynomial')
    
    % Spline Interpolant
    y2=spline(xx,yy,x);
    subplot(3,2,2)
    plot(x,y2)
    title('interpolating spline')
    
    % Special Interpolant
    epsv = [0.1,0.01,0.001];
    A=zeros(7,7);
    for l=1:3
        eps=epsv(l);
        % Construct
        for j=1:7
            A(:,j)=sqrt((xx-xx(j)).^2+eps.^2)-eps-1;
        end
        coefs = (A \ yy')';
        % coef0 = -sum(coefs)
        
        % Evaluate and Plot
        z=zeros(size(x));
        for j=1:7
            z=z+coefs(j)*(sqrt((x-xx(j)).^2+eps^2)-eps-1);
        end
        subplot(3,2,2+l)
        plot(x,z)
        hold on 
        plot(xx,yy,'o')
        title(strcat('Nonpolynomial Interpolant, eps:',num2str(eps)));
    end
  
end
