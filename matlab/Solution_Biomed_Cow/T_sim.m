t0 = 0;     % Initial time
tf = 2;     % Final time
global dt   % already defined in parameters.m file

N = floor((tf - t0)/dt) + 1;    % Total no. of time steps required

t(:,1) = t0;
X(:,1) = X0;    % Initial state

t_cut = 1/24;   % Checking at every 1 hr interval
                % This MUST be an integer multiplication of dt (because of 'ismultiple' function)

sensor = 1;     % 1: Need for medication, 0: No need for medication

for (k = 1:N-1) 
    
    if ismultiple(t(k), t_cut) | (k == N-1)
        
        disp(['t (hr) = ' num2str(t(k)*24)]);
    end

    if (sensor == 1) & ismultiple(t(k), t_cut)
        
        disp('Checking for medication need');
        sensor = Check_Medication(X(:,k));
            
        if (sensor == 0)
            
            disp('-----------------------------');
            disp('Further medication NOT needed');
            disp('-----------------------------'); pause(1);
        end
    end

    
    if (sensor == 1)
    
        u(:,k) = Control_dyn_inv(X(:,k));           
        X(:,k+1) = State(X(:,k), u(:,k));   
        
    elseif (sensor == 0)
        
        u(:,k) = 0;     % Needed to program this way to plot u                         
        X(:,k+1) = State(X(:,k), u(:,k));   
    end
    
    t(:,k+1) = t(:,k) + dt;
end
