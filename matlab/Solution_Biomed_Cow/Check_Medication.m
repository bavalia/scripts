function answer = Check_Medication(X0);

global dt x1_a;  %% what is x1_a here ??? #to-find
global x1_alert

X(:,1) = X0;
t(:,1) = 0;

t0 = 0;
tf = 2;
N = floor((tf - t0)/dt) + 1;

answer = 0;     % No medication needed

for (k = 1:N-1) 
    
   if (X(1,k) < x1_alert) 
         
       answer = 1;  % Medication needed
       break;
   end
    
    X(:,k+1) = State(X(:,k), 0);        % Update homogeneous system

    t(:,k+1) = t(:,k) + dt;
end
