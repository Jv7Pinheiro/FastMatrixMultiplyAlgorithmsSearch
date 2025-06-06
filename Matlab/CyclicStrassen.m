function [S, U, V, W] = CyclicStrassen()
% [S, U, V, W] = CyclicStrassen()
% generates Strassen's cylic matrices for 2x2x2


    S = [1 0 0 1]';

    % This is the one that came from FactorStrassen()
    U = [
         0     0
         1     0
         0     0
         1     1];
    V = [     
         0     1
         0     0
         1     1
        -1     0];
    W = [     
         1    -1
         0     1
         0     0
         0     0];

    % This came from the Original Strassen's Algorithm
    % U = [
    %      0     0
    %      0     0
    %      1     0
    %      1     1];
    % V = [     
    %      0     1
    %      1     1
    %      0     0
    %      -1    0];
    % W = [     
    %      1    -1
    %      0     0
    %      0     1
    %      0     0];

end