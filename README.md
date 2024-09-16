# Monte Carlo Pi Estimation - MATLAB

This repository contains three MATLAB scripts that estimate the value of Pi using Monte Carlo simulation. The programs use different control flow mechanisms (for loop, while loop) to perform the calculation and visualize the results.

## Files

1. **monteCarloPi.m**:
   - Uses a for loop to compute Pi with a fixed number of random points.
   - Displays a plot comparing the computed Pi value and its deviation from the true value as the number of points increases.

2. **monteCarloPiUsingWhile.m**:
   - Uses a while loop to compute Pi until a user-defined precision is achieved.
   - Displays the number of iterations required to meet the desired precision.

3. **computePiWithPrecision.m**:
   - A function that takes a user-defined level of precision.
   - Displays random points on a graphical plot as they are generated.
   - Points inside the circle are plotted in a different color than those outside.
   - The computed value of Pi is displayed both in the command window and on the plot.
   - To use the function, call:
     ```matlab
     pi_estimate = computePiWithPrecision(4);
     ```
   - This will calculate Pi to 4 significant figures and plot the results.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/bestOfaaditya/MonteCarloPiEstimation.git
