Rs = 2;
Rc = 2;

max_itr = 100;

%%
itr = 1;
while itr < max_itr
    itr = itr + 1;
    K = ci_cp_dgn(M2, Rs, Rc, printitn = 0);
    if (GetErrors(K) == 0)
        break
    end
end

if itr == max_itr
    fprintf("Not Successful\n");
else
    RNDK = cellfun(@(x) round(x), K, UniformOutput=false);
    ALG = ExtractAlgorithm(RNDK);
    ALG.C
end


	% R8.U{1} = 
	% 	     1     0     1     0     0     0     0     0
	% 	     0     1     0     1     0     0     0     0
	% 	     0     0     0     0     1     0     1     0
	% 	     0     0     0     0     0     1     0     1
	% R8.U{2} = 
	% 	     1     0     0     0     1     0     0     0
	% 	     0     0     1     0     0     0     1     0
	% 	     0     1     0     0     0     1     0     0
	% 	     0     0     0     1     0     0     0     1
	% R8.U{3} = 
	% 	     1     1     0     0     0     0     0     0
	% 	     0     0     1     1     0     0     0     0
	% 	     0     0     0     0     1     1     0     0
	% 	     0     0     0     0     0     0     1     1