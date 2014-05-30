class CreateBoroughs < ActiveRecord::Migration
  def change
    create_table :boroughs do |t|
      t.string :name
      t.string :inner_outer
      t.string :population
      t.decimal :population_density
      t.decimal :average_age
      t.decimal :population_percent_youth
      t.decimal :population_percent_working
      t.decimal :population_percent_senior
      t.decimal :population_percent_foreign
      t.string :first_largest_immigrant_group
      t.string :second_largest_immigrant_group
      t.string :third_largest_immigrant_group
      t.decimal :employment_rate
      t.string :gross_annual_pay
      t.decimal :crime_rates_per_capita
      t.decimal :percent_greenspace
      t.string :percent_cycling_adults
      t.decimal :life_satisfaction_score
      t.decimal :worthwhileness_score
      t.decimal :happiness_score
      t.decimal :anxiety_score
      t.string :political_control

      t.timestamps
    end
  end
end
