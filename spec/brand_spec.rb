require 'spec_helper'

describe (Brand) do
  describe ('#stores') do
    it { 'should has_and_belongs_to_many(:stores)'}
  end

  it("prevents user from entering a blank name") do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end

  it("ensures the length of name is at least 1 character long") do
    brand = Brand.new({:name => ''.*(1)})
    expect(brand.save()).to(eq(false))
  end
  #
  # it("capitalizes the name") do
  #   brand = Brand.create({:name => "nike"})
  #   expect(brand.name()).to(eq("Nike"))
  # end
end
