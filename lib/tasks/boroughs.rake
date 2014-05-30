require "csv"    

desc "Instantiate new Boroughs with data from CSV file."
task :boroughs => :environment do

  file = "db/borough_data.csv"

  CSV.foreach(file, headers: true) do |row|
    Borough.create(row.to_hash)
  end
end