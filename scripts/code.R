# load libraries
library(ggplot2)
library(readr)
library(ggthemes)
library(dplyr)
library(gsheet)

# load in data
survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1Uq_F6SmDOH1q5AZaxcGOIJnO-2DKdc_HUSw3akXpI3w/edit?usp=sharing')

# process the data a bit
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

# make a canvas
ggplot()

# make a plot with x and y axes
p <- ggplot(data = survey,
            aes(x = age,
                y = teeth))
p

# add points using + (not %>%)
p <- p +
  geom_point()
p

# make a scatterplot with age on y axis and teeth on x axis
ggplot(data = survey,
       aes(x = teeth,
           y = age)) +
  geom_point()

# make a scatterplot of height and age
ggplot(data = survey,
       aes(x = age,
           y = height)) +
  geom_point()

# histogram
ggplot(data = survey,
       aes(x = sleep)) +
  geom_histogram()

# make a histogram of age
ggplot(data = survey,
       aes(x = age)) +
  geom_histogram()

# make a histogram of height
ggplot(data = survey,
       aes(x = height)) +
  geom_histogram(fill = 'green', color = 'blue', alpha = 0.1) +
  labs(title = 'Height of people',
       subtitle = 'eldo is a liar...',
       caption = 'property of the cool kids 2024') +
  theme_fivethirtyeight()


# make a scatterplot of the seconds that people can wall squat and age. give it a title, make the points a color, and give it a subtitle too
ggplot(data = survey,
       aes(x = age,
           y = squat,
           color = gender)) +
  geom_point(size = 3, alpha = 0.4) +
  labs(title = 'Squatting and age',
       subtitle = 'Very good data') 

# make a bar chart of money vs love
plot_data <- survey %>%
  group_by(money_or_love) %>%
  tally
ggplot(data = plot_data,
       aes(x = money_or_love,
           y = n)) +
  geom_col()

# two variable barchart: money_or_love and gender
plot_data <- survey %>%
  group_by(money_or_love, gender) %>%
  tally
ggplot(data = plot_data,
       aes(x = gender,
           y = n,
           fill = money_or_love)) +
  geom_col(position = 'dodge')

# # make a 2 variable barchart: color and hand
# plot_data <- survey %>% ...






