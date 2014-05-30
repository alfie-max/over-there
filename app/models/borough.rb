class Borough < ActiveRecord::Base

attr_accessible :anxiety_score, :average_age, :crime_rates_per_capita, :employment_rate, :first_largest_immigrant_group, :gross_annual_pay, :happiness_score, :inner_outer, :life_satisfaction_score, :name, :percent_cycling_adults, :percent_greenspace, :political_control, :population, :population_density, :population_percent_foreign, :population_percent_senior, :population_percent_working, :population_percent_youth, :second_largest_immigrant_group, :third_largest_immigrant_group, :worthwhileness_score, :latitude, :longitude, :location

end
