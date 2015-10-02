class CreateBrands < ActiveRecord::Migration
  def change
    create_table(:brands) do |b|
      b.column(:name, :string)
      b.column(:done, :boolean)

      b.timestamps()
    end
  end
end
