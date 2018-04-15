function [abc] = archive_truncature(abc)
%ARCHIVE_TRUNCATURE apply a truncature if the archive size is exceeded
ovs = [abc.archive.ovs];
N= length(abc.archive);
size = ovs(1,:);%Size of the problem
distances = zeros(1,N);
%the norm of each current objective function
norms = zeros(size);
for i=1:size
    norms(i)=max(ovs(:,i)-min(ovs(:,i)));
    [~,order] = sort(ovs(:,i));
    distance(order(1))=inf;
    distance(order(N))=inf;
    for j = 2:N-1
        distance(j)= distance(j)+...
            (ovs(order(j-1),i)-ovs(order(j+1),i))/norms(i);
    end
end
[~,finalOrder] = sort(distances);
abc.archive = abc.archive(finalOrder(1:abc.employed_bee_count));
end
