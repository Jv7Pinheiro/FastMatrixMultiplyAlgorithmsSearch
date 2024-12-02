function soln2csv(solutions)
    for i = 1:length(solutions)
        dir = ['Solution', num2str(i), '/'];
        mkdir(dir);
        
        % Extract S U V W
        S = solutions{i}{1};
        U = solutions{i}{2};
        V = solutions{i}{3};
        W = solutions{i}{4};
        % Extract A B C
        T = cyc2fac(solutions{i});
        A = T{1};
        B = T{2};
        C = T{3};

        % Write them all
        writematrix(S, [dir, 'S.csv']);
        writematrix(S, [dir, 'U.csv']);
        writematrix(S, [dir, 'V.csv']);
        writematrix(S, [dir, 'W.csv']);
        writematrix(S, [dir, 'A.csv']);
        writematrix(S, [dir, 'B.csv']);
        writematrix(S, [dir, 'C.csv']);
    end
end

