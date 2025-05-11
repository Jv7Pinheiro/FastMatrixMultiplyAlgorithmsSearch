function make_incidence_latex(K)

    % use name to define build function
    % build_alg = str2func(['build_' name '_alg']);
    % % build algorithm's ktensor
    % K = build_alg();
    
    % get rank-one component information 
    [us,vs,uapps,vapps,~,~] = get_rank_one_comps([K{1}, K{2}, K{3}, K{4}]);
    
    % open tex file to write and add header
    % fID = fopen(['../' name '_incidence.tex'],'w');
    fprintf('\\begin{tikzpicture}[node distance=3cm and 1cm, auto]\n\n');
    
    % print top row, corresponding to u vectors
    fprintf('\t%% top row of nodes\n');
    for i = 1:length(uapps)
        fprintf('\t\\node[main node, label={\\small %d}] (%du) ', uapps(i), i);
        if i > 1
            fprintf('[right=of %du] ',i-1);
        end
        fprintf('{$\\begin{matrix} %d & %d & %d & %d \\end{matrix}$};\n', us(1,i), us(2,i), us(3,i), us(4,i));
    end
    
    % print bottom row, corresponding to v vectors
    fprintf('\n\t%% bottom row of nodes\n');
    for j = 1:length(vapps)
        fprintf('\t\\node[main node, label=below:{\\small %d}] (%dv) [below=of %du] ', vapps(j), j, j);
        fprintf('{$\\begin{matrix} %d & %d & %d & %d \\end{matrix}$};\n', ...
            vs(1,j), vs(2,j), vs(3,j), vs(4,j));
    end
    
    % print edges
    fprintf('\n\t%% edges between rows\n\t\\path[line]\n');
    % loop over u's
    for i = 1:length(uapps)
        fprintf('\t(%du)\n',i);
        for j = 1:length(vapps)
            if us(:,i)'*vs(:,j) == 0
                fprintf('\t\tedge node {} (%dv)\n',j);
            end
        end
    end
    fprintf('\t;\n');
    
    % add footer and close tex file
    fprintf('\n\\end{tikzpicture}\n');

end