require 'spec_helper'

describe(Brand) do
  describe('#store') do
    it("belongs to a store") do
      test_store = Store.create({:name => "Foot Locker"})
      test_brand = Brand.create({:name => "Nike", :brand_id => test_brand.id})
      expect(test_store.brands()).to(eq([test_brand]))
    end
  end

  # it("prevents user from entering a blank name") do
  #   brand = Brand.new({:name => ''})
  #   expect(brand.save()).to(eq(false))
  # end
  #
  # it("ensures the length of name is at least 1 character long") do
  #   brand = Brand.new({:name => ''.*(1)})
  #   expect(brand.save()).to(eq(false))
  # end
  #
  # it("capitalizes the name") do
  #   brand = Brand.create({:name => "nike"})
  #   expect(brand.name()).to(eq("Nike"))
  # end
end
