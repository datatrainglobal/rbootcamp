library(dplyr)
library(readr)
library(ggplot2)

people <- readr::read_csv('https://datatrain.cc/data/survival.csv')

people %>%
  mutate(age_group = ifelse(age > 18, 'adult', 'child')) %>%
  group_by(survived, age_group) %>%
  tally %>%
  group_by(age_group) %>%
  mutate(percentage = n / sum(n) * 100) %>%
  filter(survived == 1)

ncol(people)
nrow(people)
names(people)
head(people, 5)
tail(people, 1)

people %>%
  arrange(age)
  
people %>%
  arrange(desc(age))




people %>%
  filter(sex == 'male') %>%
  summarise(number = n())

people %>%
  filter(sex == 'female') %>%
  summarise(x = n())

people %>%
  group_by(sex) %>%
  summarise(number = n())

people %>%
  group_by(sex) %>%
  summarise(n_individuals = n()) %>%
  ungroup %>%
  mutate(percentage = n_individuals / sum(n_individuals) * 100)

people %>%
  group_by(survived) %>%
  summarise(n_people = n()) %>%
  mutate(percent = n_people / sum(n_people) * 100)

people %>%
  tally

people %>%
  group_by(sex) %>%
  tally

people %>%
  group_by(class) %>%
  tally





# What percentage of people who died were male?
people %>%
  filter(survived == 0) %>%
  group_by(sex) %>%
  tally %>%
  mutate(percent = n / sum(n) * 100) %>%
  filter(sex == 'male')


# What is the survival / death rate in each class?
people %>%
  group_by(class, survived) %>%
  tally %>%
  group_by(class) %>%
  mutate(percentage = n / sum(n) * 100)


# What is the sex of the oldest person who died?
people %>%
  filter(survived == 0) %>%
  filter(!is.na(age)) %>% 
  arrange(desc(age)) %>%
  head(1)
  
# What is the average of age of females who died?
people %>%
  filter(sex == 'female') %>%
  filter(survived == 0) %>%
  filter(!is.na(age)) %>%
  summarise(average_age = mean(age))



# What is the average age of males who survived?
people %>%
  filter(sex == 'male') %>%
  filter(survived == 1) %>%
  filter(!is.na(age)) %>%
  summarise(x = mean(age))


# combine all the filters in one line
people %>%
  filter(sex == 'male', survived == 1, !is.na(age)) %>%
  summarise(avg = mean(age))

# Make a table showing the exact number of people that died and survived, grouping also by class and sex.
people %>%
  group_by(survived, sex, class) %>%
  tally

# Create a variable named outcome. Populate this variable with the characters “survived” or “died” depending on the survived variable.
peeps <- people %>%
  mutate(outcome = ifelse(survived == 1, "survived", "died"))

# Make another variable called age_group. If the person is over 18, call them “adult”; otherwise, call them “child”.
peeps <- peeps %>%
  mutate(age_group = ifelse(age > 18, 'adult', 'child'))

# 38. Make another variable called person_type. Use paste0 to combine the sex and age_group variables, in that order.
peeps <- peeps %>%
  mutate(person_type = paste0(sex, ' ', age_group))

# 39. Make another variable called initial. This should be the first letter of each person’s last name. Hint, use substr.
peeps <- peeps %>%
  mutate(initial = substr(name, 1, 1))

# What is the most prevalent initial in the dataset?
peeps %>%
  group_by(initial) %>%
  tally %>%
  arrange(desc(n))

# 41. What is the least prevalent second letter in people’s last names?
peeps %>%
  mutate(second_letter = substr(name, 2, 2)) %>%
  group_by(second_letter) %>%
  tally %>%
  arrange(n)

# 42. Use nchar to calculate the number of letters in each person’s name, and make a variable with that value named name_length.
peeps <- peeps %>%
  mutate(name_length = nchar(name))

# 43. Who has the longest name in the dataset?
peeps %>%
  arrange(desc(name_length))
# or
peeps %>%
  filter(name_length == max(name_length)) %>%
  pull(name)

# 44. Who has the shortest name in the dataset?
peeps %>%
  filter(name_length == min(name_length)) %>%
  pull(name)

# 45. Make a variable called above_average_name_length. This should be TRUE if the person’s name length is above average, and false if below or at average.
peeps <- peeps %>%
  mutate(above_average_name_length = name_length > mean(name_length))

# 46. Who is more likely to have survived: those with short names, or those with long names.
peeps %>%
  group_by(outcome, above_average_name_length) %>%
  tally %>%
  group_by(above_average_name_length) %>%
  mutate(percentage = n / sum(n) * 100) %>%
  filter(outcome == 'survived')

# 47. What is the age of the female with the shortest name who survived?
peeps %>%
  filter(sex == 'female') %>%
  filter(outcome == 'survived') %>%
  filter(name_length == min(name_length)) %>%
  pull(age)

# 48. What is the sex of the oldest person to have died who had an above average name length?
peeps %>%
  filter(outcome == 'died') %>%
  filter(above_average_name_length == TRUE) %>%
  filter(!is.na(age)) %>%
  filter(age == max(age)) %>%
  pull(sex)

# 49. Who, on average, has shorter names: males or females?
peeps %>%
  group_by(sex) %>%
  summarise(x = mean(name_length))

# 50. What is the total number of characters in all female names, and all male names?
peeps %>%
  group_by(sex) %>%
  summarise(total_letters = sum(name_length))


#
data <- tibble(name = c('Joe', 'Jamal', 'Aurelia'),
               age = c(38, 36, 40),
               birth = c('USA', '', 'Kenya'),
               favorite_food = c(NA, 'ugali', 'shrimp'))
data %>%
  filter(!is.na(birth))

data %>%
  filter(nchar(birth) > 0 )


data %>%
  filter(birth != '')


# use select to only keep some columns
shared_report <- peeps %>%
  select(-name)
  
bad_data <- peeps %>%
  bind_rows(peeps %>% dplyr::sample_n(5))

# explore to see if we have duplicates
bad_data %>%
  group_by(id) %>%
  tally %>%
  arrange(desc(n)) 

good_data <- bad_data %>%
  distinct(id, .keep_all = TRUE)
