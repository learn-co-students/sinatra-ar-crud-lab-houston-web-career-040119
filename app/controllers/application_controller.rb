
require_relative '../../config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  def current_article
    Article.find(params[:id])
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
 
    Article.create(params)
    
    redirect "/articles/#{Article.all.last.id}"
  end
  
  get '/articles/:id' do
    @article = current_article
    erb :show
  end
  
  get '/articles/:id/edit' do
    @article = current_article
    erb :edit
  end
  
  patch '/articles/:id' do

    current_article.update(params[:article])
    redirect "/articles/#{params[:id]}"
  end
  
  delete '/articles/:id' do
    current_article.destroy
  end
  
  
end
