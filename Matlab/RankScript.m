U = reshape(A(:, 1), 4, 4);
V = reshape(A(:, 2), 4, 4);
W = reshape(A(:, 3), 4, 4);

rank(kron(eye(4), U) - kron(U', eye(4)))
rank([kron(eye(4), U) - kron(U', eye(4)); kron(eye(4), V) - kron(W', eye(4))])

% [U, S, V] = svd([kron(eye(4), A) - kron(A', eye(4)); kron(eye(4), reshape(Rs16Rc11{13}{1}(:, 5), 4, 4)) - kron(reshape(Rs16Rc11{13}{1}(:, 5), 4, 4)', eye(4))]);
% V(:, end)