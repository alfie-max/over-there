class AddBoroughIdToPostcodes < ActiveRecord::Migration
  def up
    add_column :postcodes, :borough_id, :integer
    remove_column :postcodes, :borough
  end

  def down
    add_column :postcodes, :borough, :string
    remove_column :postcodes, :borough_id
  end
end
