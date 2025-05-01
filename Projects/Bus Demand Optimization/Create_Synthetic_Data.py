import pandas as pd
import numpy as np
import jdatetime


# Set random seed for reproducibility
np.random.seed(42)

# Generate date range for one year (Persian calendar)
start_date = jdatetime.date(1403, 1, 1)
end_date = jdatetime.date(1404, 1, 1)
date_range = [start_date + jdatetime.timedelta(days=x) for x in range((end_date - start_date).days)]

# Initialize data dictionary
data = {
    'Date': [],
    'Weather': [],
    'Holiday': [],
    'Supply': [],
    'Demand': [],
    #'Weekday': [],
    #'Month': [],
    #'Season': [],
    'Replacement Statuse': []
}

# Define possible values
sex_options = ['Male', 'Female']
weather_options = ['Sunny', 'Rainy', 'Cloudy', 'Snowy']
holiday_options = [
    "Nowruz",  # Persian New Year
    "Yalda Night",  # Longest night of the year celebration
    "Chaharshanbe Suri",  # Fire-jumping festival before Nowruz
    "Ashura",  # Significant religious observance
    "Ramadan traditions",  # Including Iftar meals
    "Sizdah Bedar",  # Nature Day, end of Nowruz festivities
    "Mehregan",  # Festival of friendship and kindness
    "Non-holiday"  # Non-holiday days
]

for date in date_range:
    data['Date'].append(date.strftime('%Y-%m-%d'))

# Create DataFrame
df = pd.DataFrame(data)


