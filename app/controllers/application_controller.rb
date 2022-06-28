class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do
    result = Bakery.all
    result.to_json
  end
  
  get '/bakeries/:id' do 
    result = Bakery.find(params[:id])
    result.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    result = BakedGood.by_price
    result.to_json
  end

  get '/baked_goods/most_expensive' do
    # see the BakedGood class for the  method definition of `.by_price`
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end

end
