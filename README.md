# Pewlett-Hackard-Analysis

## Overview of Analysis

### Purpose

The purpose of this exercise was to plan for the upcoming "silver tsunami" at Pewlett-Hackard. The senior staff at Pewlett-Hackard wanted to know how many employees were getting ready to retire and how many were going to be eligible to help mentor the new employees. Pewlett-Hackard, like many other employers, wants to get ahead of the game to see where they're going to be in the future in order to better plan current decisions. 

## Results

### Method of procuring results

I used PostgreSQL and pgAdmin to import .csv files, query and tailor the data, and export the lists to answer the questions that were posed by the Pewlett-Hackard team. 

### Physical Results

- 24% of the workforce is past normal retirement age. Pewlett-Hackard has 300,025 total employees according to the employees.csv file. With the following query, I found that there are 72,458 employees at Pewlett-Hackard that were born between 1/1/1952 and 12/31/1955, making them 65-70 years old, and therefore past the normal retirement age. 72,458/300,025 = 24.1%.

![UniqueTitlesQueryBuild](https://user-images.githubusercontent.com/114685724/206034327-31cef966-0efe-4d53-8848-f2ac0b931222.png)


- 70% of retiring employees were senior level employees. This means that, as a company, Pewlett-Hackard will need to hand out a lot of internal promotions to standard Engineers or Staff or hire externally to fill the roles of over 50,000 positions. 

![CountOfRetiringTitles](https://user-images.githubusercontent.com/114685724/206034380-a3d4ece0-6d01-4ae3-81e8-d6474dfe87c1.png)


- Management positions should not be a focus. Pewlett-Hackard is only losing 2 managers according to this data (see above image). I'd need to look more into this as this feels a little bit like an outlier, but if it's true, then this makes the hiring team's job a little more focused on the doers rather than the managers. 


- Pewlett-Hackard needs to make quick changes from a mentorship standpoint (see below image). There are currently 1550 employees who qualify for the mentorship program: i.e. they were born in the year 1965. These associates are experienced and can take younger, more inexperienced employees under their wing and try to train them up to get them ready for the positions vacated by the 50,000 retiring senior employees. However, if Hewlett-Packard plans on filling those 50,000 vacancies with people mentored by the mentors, that means that each mentor would be responsible for at least 32 employees (50,000/1550). I don't think that sort of ratio will set the inexperienced employees up for success. They'll need more individualized attention so I would look to see if we can expand our pool of mentors by being less stringent with the mentorship criteria. 

![MentorshipEligibilityCount](https://user-images.githubusercontent.com/114685724/206034689-fc99783a-0c86-49fe-827e-826c9c5b2954.png)


## Summary

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

I am projecting that there will be 72,458 employees retiring with this "silver tsunami". All of these employees are between the ages of 65-70 and should be retiring at any time. This makes up 24% of the workforce at Pewlett-Hackard, so the company needs to start planning soon.

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

In a word, no. There is no where near the number of retirement-ready employees to mentor the next generation. At a ratio of 32 mentees to 1 mentor, I don't think the quality of the mentorship would be sufficient. 

### Additional queries for future research

1. I think the first thing we should research is to see if we can expand the mentorship pool to see if we can get other "relatively" experienced teammates to mentor the younger generation. I wanted to expand the stringent criteria to look for additional staff members born between 01-01-1965 and 12-31-1970 to see if that could expand the mentorship pool. After writing a few queries to see, I found a startling conclusion: everyone is old! There are no employees that work for Pewlett-Hackard that were born after February 1 of 1965. This feels a little unlikely, so I would want to look at the original data source because otherwise, Pewlett-Hackard is going to be in really rough shape.

select * from employees
where birth_date >= '1965-02-02'
order by birth_date desc

2. I wanted to also look at managers at Pewlett-Hackard so I wrote this quick query below:

select * from titles where title = 'Manager' and to_date <> '9999-01-01'

This shows all active managers at Pewlett-Hackard. There are only 15 active managers so losing 2 of them to retirement is actually not too bad for the company. That's only a reduction of 13%, which is 11 percentage points less than the overall loss of employees at Pewlett-Hackard. So, management is disproportionately affected by retirement with this subset, meaning the managers tend to run a little younger at the organization. 
