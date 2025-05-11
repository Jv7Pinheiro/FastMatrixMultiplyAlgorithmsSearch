function res = equiv_up_to_perm(U1,V1,W1,U2,V2,W2)

    res = true;
    for r = 1:size(U1,2)
        if ~includes_comp(U1,V1,W1,U2(:,r),V2(:,r),W2(:,r))
            res = false;
            return;
        end
        if ~includes_comp(U2,V2,W2,U1(:,r),V1(:,r),W1(:,r))
            res = false;
            return;
        end
    end

end

function res = includes_comp(U,V,W,u,v,w)

    res = false;
    for r = 1:size(U,2)
        if norm(u-U(:,r)) == 0 && norm(v-V(:,r)) == 0 && norm(w-W(:,r)) == 0
            res = true;
        end
    end

end