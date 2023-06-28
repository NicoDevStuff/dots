import requests
import re

# Make a request to wttr.in API
response = requests.get('https://wttr.in/Wetter(Ruhr)?format="%C+%t+%m"')

# Get the weather information from the response
weather_info = response.text.strip().split('\n')[0]

# Define a dictionary to map weather conditions to Unicode escape sequences
emoji_mapping = {
    '☀️': '\u2600\ufe0f',  # Sunny
    '☔️': '\u2614\ufe0f',  # Rainy
    '❄️': '\u2744\ufe0f',  # Snowy
    '⛅️': '\u26c5\ufe0f',  # Partly Cloudy
}

# Replace weather codes with corresponding Unicode escape sequences
for code, emoji in emoji_mapping.items():
    weather_info = weather_info.replace(code, emoji)

# Remove any remaining formatting codes from the weather information
weather_info = re.sub('\033\[.*?m', '', weather_info)

# Print the weather information
print(weather_info)
