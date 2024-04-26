library(readr)
library(dplyr)
library(ggplot2)
households <- readr::read_csv('https://datatrain.cc/data/anonymized_demography.csv')
people <- readr::read_csv('https://datatrain.cc/data/anonymized_demography_individuals.csv')

# What is the average age of people?
people %>%
  summarise(x = mean(age))
  
#   On average, who is older: men or women?
people %>%
  group_by(sex) %>%
  summarise(x = mean(age))

#   How many children are there in the dataset?
people %>%
  filter(age < 18) %>%
  tally
#   Make a histogram of age.
ggplot(data = people,
       aes(x = age)) +
  geom_histogram()

# Make a smoothed histogram using geom_density of age.
ggplot(data = people,
       aes(x = age)) +
  geom_density()
# Make a smoothed histogram of age, but make different “fill” colors for men and women.
ggplot(data = people,
       aes(x = age)) +
  geom_density(aes(fill = sex))

# Make a point chart wherein the x-axis is sex and the y-axis is age.
ggplot(data = people,
       aes(x = sex,
           y = age)) +
  geom_point()


# Replace geom_point with geom_jitter so that the points don’t overlap so much.
ggplot(data = people,
       aes(x = sex,
           y = age)) +
  geom_jitter() 
# Make the points semi-transparent.
ggplot(data = people,
       aes(x = sex,
           y = age)) +
  geom_jitter(alpha = 0.1) 

# Make the points twice as large.
ggplot(data = people,
       aes(x = sex,
           y = age)) +
  geom_jitter(alpha = 0.1, size =0.1) 

# Make a map lng lat
ggplot(data = households,
       aes(x = lng,
           y = lat,
           # size = num_hh_members,
           color = own_cattle)) +
  geom_point(alpha = 0.1) +
  theme(legend.position = 'bottom')

# explore number of people in household and toilet type
plot_data <- households %>%
  group_by(toilet_type) %>%
  summarise(average_hh_size = mean(num_hh_members))
ggplot(data = plot_data,
       aes(x = average_hh_size, y = toilet_type)) +
  geom_col()

# make a chart showing the spatial distribution of
# toilet type
ggplot(data = households,
       aes(x = lng, y = lat, color = toilet_type)) +
  geom_point(size = 0.2) +
  theme(legend.position = 'bottom')
