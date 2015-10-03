require 'spec_helper'

describe Brand do
  it("has many stores") do
    test_brand = Brand.create({:name => "Nike"})
    test_store1 = Store.create({:name => "Foot Locker", :brand_id => test_brand.id})
    test_store2 = Store.create({:name => "Jonny Sole", :brand_id => test_brand.id})
  end

  it("prevents user from entering a blank name") do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end

  it("ensures the length of name is at least 1 character long") do
    brand = Brand.new({:name => ''.*(1)})
    expect(brand.save()).to(eq(false))
  end

  it("capitalizes the name") do
    brand = Brand.create({:name => "nike"})
    expect(brand.name()).to(eq("Nike"))
  end
end
