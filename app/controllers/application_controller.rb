
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end


  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id' do |id|
    @article = Article.find(id)
    erb :show
  end

  get '/articles/:id/edit' do |id|
    @article = Article.find(id)
    erb :edit
  end

  patch '/articles/:id' do |id|
    article = Article.find(id)
    article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id/delete' do |id|
    article = Article.find(id)
    article.destroy
  end
end
