class ChangeDecimalColumnsToFloat < ActiveRecord::Migration
  def change
    change_column :boroughs, :population, 'float USING CAST(population as float)'
    change_column :boroughs, :population_density, 'float USING CAST(population_density as float)'
    change_column :boroughs, :average_age, 'float USING CAST(average_age as float)'
    change_column :boroughs, :population_percent_youth, 'float USING CAST(population_percent_youth as float)'
    change_column :boroughs, :population_percent_working, 'float USING CAST(population_percent_working as float)'
    change_column :boroughs, :population_percent_senior, 'float USING CAST(population_percent_senior as float)'
    change_column :boroughs, :population_percent_foreign, 'float USING CAST(population_percent_foreign as float)'
    change_column :boroughs, :employment_rate, 'float USING CAST(employment_rate as float)'
    change_column :boroughs, :gross_annual_pay, 'float USING CAST(gross_annual_pay as float)'
    change_column :boroughs, :crime_rates_per_capita, 'float USING CAST(crime_rates_per_capita as float)'
    change_column :boroughs, :percent_greenspace, 'float USING CAST(percent_greenspace as float)'
    change_column :boroughs, :percent_cycling_adults, 'float USING CAST(percent_cycling_adults as float)'
    change_column :boroughs, :life_satisfaction_score, 'float USING CAST(life_satisfaction_score as float)'
    change_column :boroughs, :worthwhileness_score, 'float USING CAST(worthwhileness_score as float)'
    change_column :boroughs, :happiness_score, 'float USING CAST(happiness_score as float)'
    change_column :boroughs, :anxiety_score, 'float USING CAST(anxiety_score as float)'
  end
end
