
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end

  get "/articles/:id" do
    @article = current_article
    erb :show
  end

  get "/articles/:id/edit" do
    @article = current_article
    erb :edit
  end

  patch "/articles/:id" do
    @article = current_article
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


def current_article
  Article.find(params[:id])
end


end
