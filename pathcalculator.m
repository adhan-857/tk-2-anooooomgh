function [t, x, y] = pathcalculator(n)
    % Generate random scattered (n+1) points
    t = linspace(0, 1, n+1);  % Parameter t dari 0 hingga 1
    x = rand(1, n+1) * 2 - 1;  % Random X coordinates untuk tiap tiitk dalam range [-1, 1]
    y = rand(1, n+1) * 2 - 1;  % Random Y coordinates untuk tiap titk dalam range [-1, 1]

    % Untuk plotting
    figure;
    scatter(x, y, 17, 'filled');
    title(sprintf('Random Scattered (n+1) Points for n = %d', n));
    xlabel('X coordinate');
    ylabel('Y coordinate');
    axis equal;
    grid on;
end

