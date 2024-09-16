clear; clc;

% Set the precision level
required_sig_figures = 4;

% tolerance based on significant figures
tolerance = 10^(-required_sig_figures);

inside_circle = 0;        % Counter for points inside the quarter circle
pi_estimate = 0;          % Current estimate of pi
iterations = 0;           % Count the number of iterations
stable_count = 0;         % Count how many consecutive stable estimates

% Store the previous estimate to track changes
previous_pi_estimate = 0;

% Run a while loop until 20 consecutive stable estimates are found
% We can increase this value and it will also increase the execution time
while stable_count < 20 
    x = rand();
    y = rand();
    
    % Check if the point is inside the quarter circle
    if (x^2 + y^2 <= 1)
        inside_circle = inside_circle + 1;
    end

    iterations = iterations + 1;
    pi_estimate = 4 * (inside_circle / iterations);
    
    % Check if the change in pi estimate is smaller than the tolerance
    if abs(pi_estimate - previous_pi_estimate) < tolerance
        % If stable, increment the stable count
        stable_count = stable_count + 1;
    else
        % If not stable, reset the stable count
        stable_count = 0;
    end
    
    previous_pi_estimate = pi_estimate;
end

disp(['Final estimated value of pi: ', num2str(round(pi_estimate, required_sig_figures))]);
disp(['Number of iterations to achieve ', num2str(required_sig_figures), ' significant figures: ', num2str(iterations)]);

