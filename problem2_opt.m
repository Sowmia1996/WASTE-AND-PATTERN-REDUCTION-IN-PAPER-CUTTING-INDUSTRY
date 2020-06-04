%all set of patterns imported from python 
my_patterns = load('occurance_matrix2.mat', '-ASCII');
%now using matlsb's optimization tool to solve the optimisation problem
%Write the objective function vector and vector of integer variables.
f=ones([1,size(my_patterns,1)]);
intcon=1:size(my_patterns,1);
%Write the linear equality constraints.
my_patterns1=transpose(my_patterns);
%there are no inequality constraints.so A and b are empty matrices ([]).
A=[];
b=[];
%creating matrices for equality constrints
Aeq=my_patterns1;
beq=[4;4;4;4;8;1;4;8;1;1];
%Each variable is bounded below by zero. 
lb = zeros(1,size(my_patterns,1));
% No upper bound on variables.
%call the solver.
lb = zeros(size(my_patterns,1),1);
[x,fval] = intlinprog(f,intcon,[],[],my_patterns1,beq,lb);
%printing the solution
disp(x);
disp(fval);
optimal_set=[];
reps=[];
for i=1:size(x,1)
    if x(i)~=0
        optimal_set=[optimal_set,i];
        reps=[reps,x(i)];
    end
end
disp(optimal_set)
disp(reps)
save prob2_optimal.mat optimal_set reps ;