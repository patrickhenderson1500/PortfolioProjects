# viewing the dataset

View(covid_deaths)


# selecting data I want to view

covid_deaths %>% 
  select(location, date, total_cases, new_cases, total_deaths, population) %>% 
  drop_na() # drops all na/null values


# total cases vs total deaths

covid_deaths %>% 
  select(location, date, total_cases, total_deaths) %>% 
  mutate(death_percentage = total_deaths/total_cases*100) %>% 
  drop_na()


# total cases vs total deaths in the united states

covid_deaths %>% 
  select(location, date, total_cases, total_deaths) %>% 
  filter(location == 'United States') %>%  
  mutate(death_percentage = total_deaths/total_cases*100) %>% 
  drop_na()


# percentage of population infected in the united states

covid_deaths %>% 
  select(location, date, population, total_cases) %>% 
  filter(location == 'United States') %>%  
  mutate(percent_population_infected = total_cases/population*100) %>% 
  drop_na()


# total population infected by covid-19 per location

covid_deaths %>% 
  group_by(location, population) %>%
  rename(population_infected = population) %>% 
  summarise() %>% 
  arrange(desc(population_infected)) %>% 
  drop_na() 

                                                                                                               
