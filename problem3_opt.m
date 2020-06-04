%all set of patterns imported from python 
my_patterns = load('occurance_matrix3.mat', '-ASCII');
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
beq=[6;4;21;10;38;30;14;27;1;10;21;14;17;2;10];
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
save prob3_optimal.mat optimal_set reps ;