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


# get ('/brands/new') do
#   @brands = Brand.all
#   erb (:brands)
# end
#
# post ('/bands/new') do
#   name = params.fetch('brand_name')
#   @brands = Brand.create({name: name})
#   @stores = Store.all
#   if @brand.save
#     @brands = Brand.all
#
#     erb (:brands)
#   else
#     erb (:error_band)
#   end
# end

#### Store Routes ####

get ('/stores') do
  @store = Store.all
  erb (:stores)
end
