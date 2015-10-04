require 'spec_helper'

describe (Store) do

  describe ('#brands') do
    it { 'should has_and_belongs_to_many(:brands)'}
  end

  it("prevents user from entering a blank name") do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end

  it("ensures the length of name is at least 1 character long") do
    store = Store.new({:name => ''.*(1)})
    expect(store.save()).to(eq(false))
  end

  it("capitalizes the name") do
    store = Store.create({:name => "foot locker"})
    expect(store.name()).to(eq("Foot Locker"))
  end
end
