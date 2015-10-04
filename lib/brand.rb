class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:presence => true, :length => { :minimum => 1 }})
  before_save(:capitalize_brand)

  private

  define_method(:capitalize_brand) do
    self.name=(name().split.map {|i| i.capitalize }.join(' '))
  end
end
