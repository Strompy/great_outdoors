class AddImageurlToPark < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :image_url, :string
  end
end
