function [d,t] = lab1b(np,nd,nw)
if (nargin < 1), np=1e7; nd=10; nw=4; end
hp = gcp('nocreate');
if isempty(hp), hp=parpool(nw); end
A = randn(np,nd); B = randn(np,nd);
d = zeros(np,1);
tic; 
for i = 1:np
    parfor j = 1:nd
        d(i) = d(i) + (B(i,j)-A(i,j)).^2;
    end
    d(i) = sqrt(d(i));
end
t = toc; 
delete(hp);