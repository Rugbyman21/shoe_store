class CreateStores < ActiveRecord::Migration
  def change
    create_table(:stores) do |s|
      s.column(:name, :string)
      

      s.timestamps()
    end
  end
end
