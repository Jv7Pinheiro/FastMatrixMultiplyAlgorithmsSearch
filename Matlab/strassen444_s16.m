function [U,V,W] = strassen444_s16() 
% return rank-49 soln based on Strassen's 222 alg
% U and V are col-major, W is row-major

    [u,v,w] = strassen222_s4;

    % create permutation matrix that swaps Morton for col-ordering
    P = eye(16);
    P(3,3)=0;P(5,5)=0;P(3,5)=1;P(5,3)=1;
    P(4,4)=0;P(6,6)=0;P(4,6)=1;P(6,4)=1;
    P(11,11)=0;P(13,13)=0;P(11,13)=1;P(13,11)=1;
    P(12,12)=0;P(14,14)=0;P(12,14)=1;P(14,12)=1;

    % create permutation matrix that reorders symmetric components first
    Pc = eye(49);
    order=[1:4,8:11,15:18,22:25,5:7,12:14,19:21,26:49];
    Pc=Pc(:,order)
    
    U = P*kron(u,u)*Pc;
    V = P*kron(v,v)*Pc;
    W = P*kron(w,w)*Pc;
    
end