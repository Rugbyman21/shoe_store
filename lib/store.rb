class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true, :length => { :minimum => 1 }})
  before_save(:capitalize_store)

  private

  define_method(:capitalize_store) do
    self.name=(name().split.map {|i| i.capitalize }.join(' '))
  end
end
