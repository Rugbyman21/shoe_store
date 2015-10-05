require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

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
  @store = Store.all
  erb(:brand_info)
end

delete ('/brands/:id') do
  @brand = Brand.find(params.fetch("id").to_i)
  @brand.destroy
  erb(:index)
end

get "/brands/:id/edit" do
  @brand = Brand.find(params.fetch("id").to_i)
  erb(:brand_edit)
end

patch "/brands/:id/edit" do
  @brand = Brand.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @brand.update({name: name})
  @stores = Store.all
  erb(:brand_info)
end

#### Store Routes ####

get ('/stores') do
  @store = Store.all
  erb (:stores)
end
