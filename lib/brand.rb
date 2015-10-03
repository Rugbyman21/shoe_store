class Brand < ActiveRecord::Base
  has_many(:stores)
  validates(:name, {:presence => true, :length => { :minimum => 1 }})
  before_save(:capitalize_brand)

  private

    define_method(:capitalize_brand) do
      self.name=(name.capitalize)
    end
end
