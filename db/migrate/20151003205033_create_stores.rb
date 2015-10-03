class CreateStores < ActiveRecord::Migration
  def change
    create_table(:stores) do |s|
      s.column(:name, :string)
      s.column(:done, :boolean)

      s.timestamps()
    end
  end
end
