class ApplicationController < Sinatra::Base
    
  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do 
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do 

    bakeries = Bakery.find(params[:id])

    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do 

    baked_goods = BakedGood.all.order('price DESC')

    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do 

    baked_goods = BakedGood.all.order('price DESC').first

    baked_goods.to_json
  end

end

#GET /bakeries: returns an array of JSON objects for all bakeries in the database. (done)
#GET /bakeries/:id: returns a single bakery as JSON with its baked goods nested in an array. Use the id from the URL to look up the correct #bakery. (HINT: you'll need to pass in some custom options to the #to_json (Links to an external site.) method.)
#GET /baked_goods/by_price: returns an array of baked goods as JSON, sorted by price in descending order. (HINT: how can you use Active Record to #sort the baked goods in a particular order?)
#GET /baked_goods/most_expensive: returns the single most expensive baked good as JSON. (HINT: how can you use Active Record to sort the baked #goods in a particular order?)