function boolean = dominates(s1, s2)
%DOMINATES Test if s1 dominates s2
    b1 = (sum(s1.ovs <= s2.ovs) >= length(s1.ovs));
    if b1
        b2 = (sum(s1.ovs< s2.ovs) >= 1);
        boolean = b2;
    else
        boolean = b1;
    end
end

