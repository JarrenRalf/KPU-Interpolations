function y = HornersAlgorithm(coeff, x)
% Given the coefficient vector for the chosen polynomial, as well as the
% points at which you want the function to be evaluated at,
% HornersAlgorithm will evaluate the function at those points using a 
% nested form in order to reduce the number of elementary operations 
% compared to the traditional computation.
% 
%       coeff = The vector of coefficients for chosen polynomial. Should be
%                  ordered, starting with the constant term and ending with
%                  the coefficient for the term with the highest power.
%           x = The matrix of points where you want the function evaluated
%
% @author Jarren Ralf
    
    % Check whether a row vector or a column vector was sent to the function
    if(size(coeff, 1) == 1)
        coeff = coeff'; % Make the coefficient matrix a column vector
    end
    
    n = size(coeff, 1); % The number of coefficients of the polynomial

    polynomial = coeff(n); % Initialize the first term prior to loop
    
    % Build the polynomial in nested format whilst evaluating at x
    for i = n - 1:-1:1
        polynomial = polynomial.*x + coeff(i);
    end
    
    y = polynomial;
end