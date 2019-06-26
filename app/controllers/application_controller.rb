class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # open recipe form
  get '/recipes/new' do
    erb :new
  end

  # show all recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #show recipe
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

# create a new recipe
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  # update a recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  # delete a recipe
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
