function Alg = ExtractAlgorithm(K)
%EXTRACTALGORITHM checks if K is a valid algorithm and then returns the 
%symbolic algorithms incoded in the cyclic factor matrices.
%
%   Alg = EXTRACTALGORITHM(K) returns a struct with three elements:
%       Alg.M -> the multiplies of the matrices entries
%       Alg.C -> the result of A*B in implict format where its entries are
%           the multiplies defnied by Alg.M
%       Alg.Full -> substitutes the Alg.C entries with the explicit
%           multiplies in Alg.M

    T = cyc2fac(K);
    dim = sqrt(size(K{1},1));
    A = sym('A', [dim, dim], 'real');
    B = sym('B', [dim, dim], 'real');
    C = sym('C', [dim, dim], 'real');

    vecA = A(:);
    vecB = B(:);
    Explicit_C = C(:);
    Implicit_C = C(:);
    Result = A*B;
    rank = size(T{1}, 2);

    M = sym('M', [rank, 2], 'real');
    Mt = sym('M', [rank, 1]);
    
    for i = 1:rank
        for j = 1:2
            M(i, j) = 0;
        end
    end

    for i = 1:dim^2
        Explicit_C(i) = 0;
        Implicit_C(i) = 0;
    end

    for i = 1:rank
        for j = 1:3
            if j == 1
                for k = 1:size(T{1}, 1)
                    if (T{1}(k, i) ==  1)
                        M(i, 1) = M(i, 1) + vecA(k);
                    elseif (T{1}(k, i) ==  -1)
                        M(i, 1) = M(i, 1) - vecA(k);
                    end
                end
            elseif j == 2
                for k = 1:size(T{2}, 1)
                    if (T{2}(k, i) ==  1)
                        M(i, 2) = M(i, 2) + vecB(k);
                    elseif (T{2}(k, i) ==  -1)
                        M(i, 2) = M(i, 2) - vecB(k);
                    end
                end
            elseif j == 3
                for k = 1:size(T{3}, 1)
                    if (T{3}(k, i) == 1)
                        Explicit_C(k) = Explicit_C(k) + M(i, 1)*M(i, 2);
                        Implicit_C(k) = Implicit_C(k) + Mt(i);
                    elseif (T{3}(k, i) == -1)
                        Explicit_C(k) = Explicit_C(k) - M(i, 1)*M(i, 2);
                        Implicit_C(k) = Implicit_C(k) - Mt(i);
                    end
                end
            end
        end
    end
    Areal = randi(10, [2, 2]);
    Breal = randi(10, [2, 2]);

    True = subs(Result, A, Areal);
    True = subs(True, B, Breal)';
    True = True(:);

    Algo = subs(Explicit_C, A, Areal);
    Algo = subs(Algo, B, Breal);

    
    if (~isequal(Algo, True))
        fprintf("Algorithm is not successful\n");
        fprintf("True | Algorithm | Difference\n");
        Diff = True - Algo;
        for i = 1:length(Algo)
            fprintf("%4d | %9d | %10d\n", True(i), Algo(i), Diff(i));
        end
    else
        fprintf("Algorithm is successful\n\n");
    end

    Alg.M = M;
    Alg.C = Implicit_C;
    Alg.Full = Explicit_C;
end