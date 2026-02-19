%% Name :Jamaalullah Abdul Rahman MABD941 Simulink script%%
%  Date : 21/10/2025
%  The script below is the MATLAB script for the simulink model

clearvars;
%% Initialise Varibles

m0 = 0.6;                        % unbalanced mass (kg)
m1=17.65;                        % mass of drum (kg)
m=17.65+0.6;                     % total mass of system (kg)
c=[];                            % damping coefficient (Ns/m)
c1=55;                           % c1 value
c2=142.11;                       % c2 value
k=3074;                          % Linear spring coefficient (N/m)
w = 10;                          % Washing machine drum speed (rad/s)
e=0.2;                           % eccentricitiy of unbalanced mass (m)
x0=0.0026;                       % initial mass 1 displacement (m)
v0=-0.0037;                      % initial mass 1 velocity (m/s)


% getting range of w in terms of rad/s
a=10*pi/60; 
b=5*pi/60;
z=800*pi/60;
d = a:b:z;

%rpm range
rpm = 10:5:800; 


%initialising zeros array for c1 and c2
displacements_c1 = zeros(length(d),1);
displacements_c2 = zeros(length(d),1);

velocities_c1=zeros(length(d),1);
velocities_c2=zeros(length(d),1);

forces_c1 = zeros(length(d),1);
forces_c2 = zeros(length(d),1);

SS_Vib_Ampc1 = zeros(length(d),1);
SS_Vib_Ampc2 = zeros(length(d),1);

F_T_endc1 = zeros(length(d),1);
F_T_endc2 = zeros(length(d),1);





%% Simulation loop
for i = 1:length(d)
    w=d(i);                                         % omega in terms of rad/s
    T = 2*pi/(w);                                   %time period

    %c1 calcs and sim%
    c= c1;                                         
    sim("WashingMachineModel.slx",60);

    %extract data from simulink model
    displacements_c1(i)= x1(end);                   % displacement at end for c1
    velocities_c1(i)= v1(end);                      % velocity at end for c1
    forces_c1(i)= F_T(end);                         % forces at end for c1
   
   
    %getting the time for 3 time periods for c1
    tend_c1=tout(end);
    ts_c1 = tend_c1 - 3*T;                          % geting the time taken for last 3 periods c1
    x_signal = x1;


    % steady state vibration amplitude c1
    SS_start_index_c1 = find(tout >= ts_c1,1);      % Finding the index for steady state begin
    SS = x_signal(SS_start_index_c1:end);           % Getting the displacement range of the steady state in the last 3 periods

    Xss_minc1 = min(SS);                            % Finding min value of SS displacement
    Xss_maxc1 = max(SS);                            % Finding max value of SS displacement

    SS_Vib_Ampc1(i) = (Xss_maxc1-Xss_minc1)/2;      % storing the SS vibration amplitude value calculated
    
    
    % Steady state force amplitude c1
    force_c1 = F_T(SS_start_index_c1:end);          % Getting the force range of the steady state in the last 3 periods
    F_T_min_c1 = min(force_c1);                     % Finding min value of SS force
    F_T_max_c1 = max(force_c1);                     % Finding max value of SS force

    F_T_endc1(i)= (F_T_max_c1-F_T_min_c1)/2;        % storing the SS force amplitude value calculated


    %c2 calcs and sim%

    % steady state vibration amplitude c2
    c=c2;
    sim("WashingMachineModel.slx",60);
    
    %extract data from simulink model with c2 
    displacements_c2(i)= x1(end);                    % displacement at end for c2
    velocities_c2(i)= v1(end);                       % velocities at end for c2
    forces_c2(i)= F_T(end);                          % forces at end for c1
   
   
    % getting the time for 3 time periods for c2
    tend_c2=tout(end);
    ts_c2 = tend_c2- 3*T;                            % geting the time taken for last 3 periods c2
    x_signal = x1;


    % steady state vibration amplitude c2
    SS_start_index_c2 = find(tout >= ts_c2,1);       % Finding the index for steady state begin c2 
    SS = x_signal(SS_start_index_c2:end);            % Getting the displacement range of the steady state in the last 3 periods c2

    Xss_minc2 = min(SS);                             % Finding min value of SS displacement
    Xss_maxc2 = max(SS);                             % Finding max value of SS displacement

    SS_Vib_Ampc2(i) = (Xss_maxc2-Xss_minc2)/2;       % storing the SS vibration amplitude value calculated


   
    % Steady state force amplitude c2
    force_c2 = F_T(SS_start_index_c2:end);           % Getting the force range of the steady state in the last 3 periods
    F_T_min_c2 = min(force_c2);                      % Finding min value of SS force
    F_T_max_c2 = max(force_c2);                      % Finding max value of SS force

    F_T_endc2(i)= (F_T_max_c2-F_T_min_c2)/2;         % storing the SS force amplitude value calculated
    
    clear x1 v1 F_T %avoid copying wrong data

end

% calculating transmissibility
Transmissibility_c1 = F_T_endc1./(m0*e*(w^2));
Transmissibility_c2 = F_T_endc2./(m0*e*(w^2));





%% Plotting

subplot(8,1,[1,2]);
plot (rpm ,SS_Vib_Ampc1,'LineWidth',1.5) ;
grid on ; hold on,
plot(rpm,SS_Vib_Ampc2,'--','LineWidth',1.5);
xlabel ( ' Machine speed (rpm) ') ; ylabel ( ' Amplitude (m) ') ;
title ( ' Vibration Amplitude ') ;
legend ( ' \zeta_1 = 0.12 ' , ' \zeta_2 = 0.30 ' , ' Location ' , ' NorthEast ') ;


subplot(8,1,[4,5]);
plot (rpm ,F_T_endc1,'LineWidth',1.5) ;
grid on ; hold on;
plot(rpm,F_T_endc2,'--','LineWidth',1.5);
xlabel ( ' Machine speed (rpm) ') ; ylabel ( ' Force (N) ') ;
title ( ' Forces Transmitted ') ;


subplot(8,1,[7,8]);
plot (rpm ,Transmissibility_c1,'LineWidth',1.5) ;
grid on ; hold on;
plot(rpm,Transmissibility_c2,'--','LineWidth',1.5);
xlabel ( ' Machine speed (rpm) ') ; ylabel ( ' Transmissibility (-)') ;
title ( ' Transmissibility ') ;
