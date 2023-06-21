function [nd,ind,d,id] = nondominated(y)

[dim,numpoints] = size(y);

k = ones(1,numpoints);
for i=1:numpoints
   for j=1:numpoints
      if i~=j
         t = dominance_relation(y(:,i),y(:,j));
         if t == +1
            k(i) = 0;
            break;
         end
      end
   end
end
k = logical(k);
nd = y(:,k); % nondominated vectors
d = y(:,~k); % dominated vectors

i = 1:numpoints;
ind = i(k);
id = i(~k);
