function [abc] = archive_truncature(abc)
%ARCHIVE_TRUNCATURE apply a crowding distance truncature if the archive size is exceeded
S = length(abc.config.problem.functions);
N= length(abc.archive);
ovs = reshape([abc.archive.ovs],[N S]);
distances = zeros(1,N);
%the norm of each current objective function
norms = zeros(S);
for i=1:S
    norms(i)=max(ovs(:,i)-min(ovs(:,i)));
    [~,order] = sort(ovs(:,i));
    distances(order(1))=inf;
    distances(order(N))=inf;
    for j = 2:N-1
        distances(order(j))= distances(order(j))+...
            (ovs(order(j-1),i)-ovs(order(j+1),i))/norms(i);
    end
end
[~,finalOrder] = sort(distances,'descend');
abc.archive = abc.archive(finalOrder(1:abc.employed_bee_count));
end

