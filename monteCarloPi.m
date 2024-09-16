clear; clc;


N = 1000;  % Set the total number of points

% Initialize counters and arrays
inside_circle = 0;    % Counter for points inside the quarter circle
pi_estimates = zeros(1, N);  % Array to store pi estimates
deviation = zeros(1, N);     % Array to store deviation from true pi
execution_times = zeros(1, N);  % Array to store execution times
precision = zeros(1, N);     % Array to store precision (% accuracy)

% Start overall timer
tic;

for i = 1:N
    % Generate random points (x, y)
    x = rand();
    y = rand();
    
    % Check if the point is inside the quarter circle
    if (x^2 + y^2 <= 1)
        inside_circle = inside_circle + 1;
    end
    
    pi_estimates(i) = 4 * (inside_circle / i);
    
    deviation(i) = abs(pi - pi_estimates(i));
    
    % Compute precision (% accuracy)
    precision(i) = 100 * (1 - deviation(i) / pi);
    
    % Record execution time up to this point
    execution_times(i) = toc;
end

% Plot 1: True pi, Estimated pi, and Deviation vs Number of Points
figure;
plot(1:N, pi_estimates, 'b', 'DisplayName', 'Estimated \pi');
hold on;
yline(pi, 'r-', 'DisplayName', 'True \pi');  % True value of pi
plot(1:N, deviation, 'g', 'DisplayName', 'Deviation');
title('Estimated \pi, True \pi, and Deviation vs. Number of Points');
xlabel('Number of Points');
ylabel('Value / Deviation');
legend('Location', 'best');
grid on;

% Plot 2: Execution Time and Precision vs Number of Points
figure;
yyaxis left;  % Left axis for execution time
plot(1:N, execution_times, 'm', 'DisplayName', 'Execution Time');
ylabel('Execution Time (seconds)');
yyaxis right;  % Right axis for precision (%)
plot(1:N, precision, 'k', 'DisplayName', 'Precision (%)');
ylabel('Precision (%)');
title('Execution Time and Precision vs. Number of Points');
xlabel('Number of Points');
legend('Location', 'best');
grid on;

% Display the final estimated value of pi and execution time
disp(['Final estimated value of \pi: ', num2str(pi_estimates(end))]);
