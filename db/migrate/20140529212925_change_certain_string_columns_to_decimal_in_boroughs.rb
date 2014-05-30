class ChangeCertainStringColumnsToDecimalInBoroughs < ActiveRecord::Migration
  def change
    change_column :boroughs, :population, 'decimal USING CAST(population as decimal)'
    change_column :boroughs, :gross_annual_pay, 'decimal USING CAST(gross_annual_pay as decimal)'
    change_column :boroughs, :percent_cycling_adults, 'decimal USING CAST(percent_cycling_adults as decimal)'
  end
end
