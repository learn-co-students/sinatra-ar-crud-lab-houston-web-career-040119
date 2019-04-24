
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #Read - All articles
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #Create
  get '/articles/new' do
    erb :new
  end

  #Read - Individual article
  get '/articles/:id' do
    @article = Article.all.find(params[:id])
    erb :show
  end

  post '/articles' do
    new_article = Article.create(title:params[:title],content:params[:content])
    redirect "/articles/#{new_article.id}"
  end

  #Edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.update(title:params[:title],content:params[:content])
    redirect "/articles/#{article.id}"
  end

  #delete
  delete '/articles/:id' do
    Article.find(params[:id]).destroy
    redirect '/articles'
  end

end
