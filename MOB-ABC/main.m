%Parameters : Hive size  iteration_max   tau
config = configuration(100,300,0.75);
%Parameter : problem name FON SCH ZDT1~6
config.problem = config.select_problem("ZDT4");
%Run
I = 5;
c = zeros(1,I);
d = zeros(1,I);

for i = 1:I
%    config.tau = 0.55+i*0.03;
    abc = abc_algorithm(config);
    abc = abc.run();
    c(i) = diversity_metric(abc.archive,config);
    d(i) = gamma_metric(abc.archive,config,500);
end