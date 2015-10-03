class CreateStores < ActiveRecord::Migration
  def change
    create_table(:stores) do |s|
      s.column(:name, :string)
      s.column(:brand_id, :integer)

      s.timestamps()
    end
  end
end
