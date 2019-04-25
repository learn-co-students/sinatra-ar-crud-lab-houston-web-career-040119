require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  end

  get '/' do # index
  redirect to "/articles"
  end

  get "/articles" do #new // renders the new.erb
  @articles = Article.all
  erb :index
  end

  get '/articles/new' do  #new //
  @article = Article.new #create new article
  erb :new #renders new.erb
  end

  post "/articles" do #create
  @article = Article.create(params)#params is a hash
  redirect to "/articles/#{ @article.id }"
  end


  get "/articles/:id" do #show #should use ActiveRecord to grab the article with the id that is in the params
  @article = Article.find(params[:id])
  erb :show
  end

  get "/articles/:id/edit" do #edit  // renders the view edit.erb
  @article = Article.find(params[:id])
  erb :edit
  end

 patch "/articles/:id" do #update
  @article = Article.find(params[:id])
  @article.update(params[:article])
  redirect to "/articles/#{ @article.id }"
  end

  delete "/articles/:id" do #delete
  Article.destroy(params[:id])
  redirect to "/articles"
  end



end
