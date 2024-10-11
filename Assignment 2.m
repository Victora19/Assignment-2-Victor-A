% Author Name: Victor Adeyeri
% Email: adeyer93@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Assignment 2
% Date: October 11th, 2024

%% Task 1: Population Growth Analysis
% This task calculates the population growth over 5 years.
populaton = [5000, 5200, 5350, 5600, 5800]; % Population data for each year (Typo in variable name)

% Calculate how much the population grew each year
growth_rate = (populaton(2:end) - populaton(1:end-1)) ./ populaton(1:end-1); 

% Combine population and growth rate into a table
pop_data = [populaton; [0 growth_rate]]; % Growth rate starts with 0 for the first year

% Print each year's population and growth rate
fprintf('Year\tPopulation\tGrowth Rate (%%)\n');
for i = 1:length(populaton)
    fprintf('%d\t%d\t\t%.2f%%\n', i, pop_data(1, i), pop_data(2, i) * 100);
end

% Explanation:
% - Created a list of population numbers for 5 years.
% - Calculated how much the population changed each year.
% - Made a table that combines the population and the growth rate.
% - Printed the information year by year.

%% Task 2: Simple Encryption Function
% This task is to make a simple function that shifts letters in a message.

function encrypted_message = caeser_cipher(message, shift)
    % Function to shift each letter in the message by a certain number
    encrypted_message = char(mod((double(message) - 'a' + shift), 26) + 'a');
end

% Ask user for a message and a shift value
msg = input('Enter a message to encrypt (lowercase only): ', 's'); % Using 'msg' instead of 'message'
shft = input('Enter a shift value between 1 and 25: '); % Using 'shft' instead of 'shift'

% Encrypt the message using the function
encrypted_message = caeser_cipher(msg, shft); % Function name has a small typo

% Show the original and encrypted message
fprintf('Original message: %s\n', msg);
fprintf('Encrypted message: %s\n', encrypted_message);

% Explanation:
% - Created a function to shift letters in a message (Caesar cipher).
% - Got input from the user for a message and shift value.
% - Called the function to shift the message and showed the results.

%% Task 3: Weather Data Analysis
% This task reads weather data from a file and finds some statistics.

% Make a table of weather data
weather_data = {
    'Date', 'Temperature', 'Humidity', 'Precipitation';
    '2024-09-01', 25.5, 60, 0;
    '2024-09-02', 26.0, 65, 5;
    '2024-09-03', 24.5, 70, 10;
    '2024-09-04', 23.0, 75, 15;
    '2024-09-05', 22.5, 80, 20
};

% Save the data to a file
writecell(weather_data, 'weather_data.txt');

% Read the data back from the file
data = readcell('weather_data.txt', 'Delimiter', ',');

% Get numbers from the file and put them into vectors
temperature = cell2mat(data(2:end, 2));
humidity = cell2mat(data(2:end, 3));
precipitation = cell2mat(data(2:end, 4));

% Find the average temperature, humidity, and total precipitation
avg_temp = mean(temperature);
avg_humidity = mean(humidity);
total_precipitation = sum(precipitation);

% Save these results to another file
summary_data = {
    'Average Temperature', avg_temp;
    'Average Humidity', avg_humidity;
    'Total Precipitation', total_precipitation
};
writecell(summary_data, 'weather_summary.txt');

% Explanation:
% - Created a table with weather data like temperature and humidity.
% - Saved the table to a file and then read the file back.
% - Found the average temperature, humidity, and total precipitation.
% - Saved these summary values to another file.

%% Task 4: Solar System Visualization
% This task creates a visualization of planet sizes and distances.

planet_distances = [0.39, 0.72, 1, 1.52, 5.2, 9.58, 19.22, 30.05]; % Distances from the sun (in AU)
planet_sizes = [0.38, 0.95, 1, 0.53, 11.21, 9.45, 4.01, 3.88]; % Relative sizes (Earth = 1)

% Make a figure with two subplots
figure;
subplot(2, 1, 1);
scatter(planet_distances, planet_sizes, 100, 'filled'); % Plot sizes and distances
title('Planet Distances vs Sizes');
xlabel('Distance from Sun (AU)');
ylabel('Relative Size (Earth = 1)');
legend('Planets');

subplot(2, 1, 2);
bar(planet_distances); % Bar chart of planet distances
title('Planet Distances');
xlabel('Planets');
ylabel('Distance from Sun (AU)');
xticklabels({'Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'});

% Save the figure as an image
saveas(gcf, 'solar_system_visualization.png');

% Explanation:
% - Created vectors for planet distances and sizes.
% - Made a scatter plot for distances vs. sizes and a bar chart for distances.
% - Labeled the charts and saved them as an image file.

%% Task 5: Stock Market Analysis
% This task analyzes a fake stock's daily closing prices over 30 days.

% Make a list of 30 random stock prices
stock_prices = randi([50, 150], 30, 1); % Random prices between $50 and $150
writematrix(stock_prices, 'stock_data.txt');

% Read the stock prices from the file
stock_data = readmatrix('stock_data.txt');

% Calculate stock statistics
avg_price = mean(stock_data);
highest_price = max(stock_data);
lowest_price = min(stock_data);
days_price_increased = sum(diff(stock_data) > 0); % Count days the price went up

% Print the statistics
fprintf('Average Closing Price: %.2f\n', avg_price);
fprintf('Highest Closing Price: %.2f\n', highest_price);
fprintf('Lowest Closing Price: %.2f\n', lowest_price);
fprintf('Number of Days Price Increased: %d\n', days_price_increased);

% Plot the stock prices
figure;
plot(stock_data, 'b', 'LineWidth', 1.5);
hold on;
yline(avg_price, 'r--', 'Average Price');
yline(highest_price, 'g--', 'Highest Price');
yline(lowest_price, 'k--', 'Lowest Price');
hold off;
title('Stock Price Analysis');
xlabel('Days');
ylabel('Closing Price');
legend('Daily Closing Price', 'Average Price', 'Highest Price', 'Lowest Price');

% Save the plot as an image
saveas(gcf, 'stock_analysis.png');

% Save summary to a file
stock_summary = {
    'Average Closing Price', avg_price;
    'Highest Closing Price', highest_price;
    'Lowest Closing Price', lowest_price;
    'Days Price Increased', days_price_increased
};
writecell(stock_summary, 'stock_summary.txt');

% Explanation:
% - Created random stock prices for 30 days and saved them to a file.
% - Read the prices and calculated statistics like average, highest, and lowest price.
% - Made a plot of the stock prices and saved it as an image.
% - Saved a summary of the stock analysis to a file.
