library(dplyr)
library(readr)
library(ggplot2)
library(gsheet)

survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1Uq_F6SmDOH1q5AZaxcGOIJnO-2DKdc_HUSw3akXpI3w/edit?usp=sharing')

# what are the variable names
names(survey)

# change the variable names
names(survey) <-
  c(
    'timestamp', #  'Timestamp',
    'name', #'What is your name?',
    'email', #'What is your email address?',
    'experience', #'How much experience do you have in R?',
    'alcohol', #'How many alcoholic beverages do you drink per week?',
    'squat', #'How long do you think you can hold a wall squat (seconds)? (ie, the "imaginary chair")',
    'egypt_or_france', #'Would you rather visit the pyramids of Egypt or the Eiffel tower of Paris?',
    'bike', #'Do you know how to ride a bike?',
    'swim', #'Do you know how to swim?',
    'age', #'How old are you in years?',
    'origin', #'Where are you from?',
    'swahili', #'Do you know how to speak Swahili?',
    'height', #'How tall are you in centimeters?',
    'shoe', #'What size shoe do you wear (EU sizes)?',
    'hand', #'Are you right-handed or left-handed?',
    'happy', #'How happy do you consider yourself on a scale from 1 to 5, with 1 being extremely unhappy, 5 being extremely happy, and 3 being the average person',
    'gender', #'What is your gender?',
    'sing', #'Do you consider yourself better or worse than average at singing?',
    'dance', #'Do you consider yourself better than average at dancing?',
    'sleep', #'How many hours did you sleep last night?',
    'net', #'Did you sleep under a mosquito net last night?',
    'eat', #'Would you rather eat',
    'money_or_love', #'What is better, money or love?',
    'pizza_or_love', #'What is better, pizza or love?',
    'adjective', #'What is the one adjective that best describes you',
    'siblings',
    'teeth',
    'color',
    'ivermectin',
    'pilau_or_tchapati',
    'race',
    'live',
    'kwale',
    'movies')

# TEAMS

# Team pawpaw
# - 1. Who is the oldest person amongst those who drink the most alcohol?
# -2. What's the average sleeping hours in people aged more than 30 vs those younger than 30?
# -3. Do Kwaleans prefer Chapati or Pilau?
# Team blue
# - 1. Which gender swims the most?
# - 2. Which gender drinks more?
# - 3. Does chapati or pilau correlate with who people think will win the vehicle race?
# Team Simba
# - 1. Who drinks more, men or women?
# - 2. How many people above 30 think Eldo would win the race?
# - 3. What % of males prefer Paris over Egypt?
# Team ivermectin
# - 1. Where do men over 30 hang out the most?
# - 2. What is preferred - money or love - by gender?
# - 3. What % of left vs right handers slept under a mosquito net last night?
# Team ninja
# - 1. What % of men/women prefer Paris?
# - 2. What is the most preferred color based on age?
# - 3. Which gender prefers love vs money?