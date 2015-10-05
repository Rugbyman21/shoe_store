require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

#### Brand Routes ####

get ('/brands') do
    @brands = Brand.all
  erb(:brand)
end

post ('/brands') do
  name = params.fetch("name")
  Brand.create({name: name})
  @brands = Brand.all
  @stores = Store.all
  erb(:brand)
end

get ('/brands/:id') do
  @brand = Brand.find(params.fetch("id").to_i)
  @stores = Store.all
  erb(:brand_info)
end

patch ('/brands/:id') do
  @brand = Brand.find(params.fetch("id").to_i)
  store_ids = params.fetch("store_ids")
  @brand.update({:store_ids => store_ids})
  @stores = Store.all
  erb(:brand_info)
end

delete ('/brands/:id') do
  @brand = Brand.find(params.fetch("id").to_i)
  @brand.destroy
  erb(:index)
end

get ('/brands/:id/edit') do
  @brand = Brand.find(params.fetch("id").to_i)
  erb(:brand_edit)
end

patch ('/brands/:id/edit') do
  @brand = Brand.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @brand.update({name: name})
  @stores = Store.all
  erb(:brand_info)
end

#### Store Routes ####

get ('/stores') do
  @stores = Store.all
  erb (:stores)
end

post ('/stores') do
  name = params.fetch("name")
  Store.create({name: name})
  @brands = Brand.all
  @stores = Store.all
  erb(:stores)
end

get ('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i)
  @stores = Store.all
  erb(:store_info)
end

delete ('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i)
  @store.destroy
  erb(:index)
end

get "/stores/:id/edit" do
  @store = Store.find(params.fetch("id").to_i)
  erb(:store_edit)
end

patch "/stores/:id/edit" do
  @store = Store.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @store.update({name: name})
  erb(:store_info)
end
