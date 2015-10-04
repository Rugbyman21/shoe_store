class BrandsStores < ActiveRecord::Migration
  def change
    create_table(:brands_stores) do |ds|
     ds.column(:brand_id, :integer)
     ds.column(:store_id, :integer)
    end
  end
end
