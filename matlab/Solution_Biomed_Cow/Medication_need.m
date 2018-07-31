% Time simulation for sensing the need of medication
% ==================================================

% Initial condition
% -----------------

x1_0 = 0;

x2_min = - (A2*atanh(Vcl/A2) - A2*atanh(Vcl_0/A2));
x2_0 = Random(0.8*x2_min, 1.1*x2_min);

X(:,1) = [  x1_0
            x2_0  ];

% Simulation
% ----------

t0 = 0;
t(:,1) = t0; % time unit in day

k = 1;
t_disp = 0;

while (k > 0) 
    
    if (t(k) >= t_disp)
        
        disp('t (hr) = '), disp(t(k)*24); %time unit changed from day to hour
        t_disp = t_disp + 1/24;
    end
       
    if (X(1,k) < x1_alert)
        
        disp('Bad patient: Medication starts');
        disp('t (min) = '), disp(t(k)*24*60);
        break;
    end
    
    
   	% Update
   	% ======
	
    X(:,k+1) = State(X(:,k), 0);
    
    t(:,k+1) = t(:,k) + dt;
    k = k + 1;
    
end

X0 = X(:, k);
