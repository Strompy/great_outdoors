class CreateParkSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :park_searches do |t|
      t.references :park, foreign_key: true
      t.references :search, foreign_key: true
    end
  end
end
