function pi_estimate = computePiWithPrecision(precision)

    figure;
    clf;
    
    % tolerance based on precision
    tolerance = 10^(-precision);

    inside_circle = 0;        % Counter for points inside the quarter circle
    pi_estimate = 0;          % Current estimate of pi
    iterations = 0;           % Count the number of iterations
    stable_count = 0;         % Count how many consecutive stable estimates
    previous_pi_estimate = 0; % Store the previous estimate to track changes

    hold on;
    axis equal;
    xlim([0, 1]);
    ylim([0, 1]);
    xlabel('X');
    ylabel('Y');
    grid on;

    % Plotting quarter circle as a reference
    theta = linspace(0, pi/2, 100);
    plot(cos(theta), sin(theta), 'r-', 'LineWidth', 2);

    % Initialize arrays to store points for batch plotting
    x_inside = [];
    y_inside = [];
    x_outside = [];
    y_outside = [];

    while stable_count < 20
        x = rand();  
        y = rand(); 

        % Check if the point is inside the quarter circle
        if (x^2 + y^2 <= 1)
            inside_circle = inside_circle + 1;
            x_inside = [x_inside, x];  % Store points inside the circle
            y_inside = [y_inside, y];
        else
            x_outside = [x_outside, x];  % Store points outside the circle
            y_outside = [y_outside, y];
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
        % Plot points in batches every 100 iterations for better performance
        if mod(iterations, 100) == 0
            plot(x_inside, y_inside, 'b.');  % Plot points inside the circle (blue)
            plot(x_outside, y_outside, 'r.'); % Plot points outside the circle (red)
            drawnow;  % Update the plot
            % Clear arrays to reduce memory usage
            x_inside = [];
            y_inside = [];
            x_outside = [];
            y_outside = [];
        end
    end
    pi_estimate_rounded = round(pi_estimate, precision);
    disp(['Final estimated value of pi: ', num2str(pi_estimate_rounded)]);
    disp(['Number of iterations to achieve ', num2str(precision), ' significant figures: ', num2str(iterations)]);

    text(0.5, 1.05, ['Final \pi Estimate: ', num2str(pi_estimate_rounded)], 'FontSize', 12, 'HorizontalAlignment', 'center');
    hold off;

    % Return the computed pi value
    pi_estimate = pi_estimate_rounded;
end
