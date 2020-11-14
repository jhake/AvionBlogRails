class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
    puts params
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new #(article_params)
    @article.name = params[:article][:name]
    @article.body = params[:article][:body]
    if @article.save
        redirect_to articles_path
    else
        render :new
    end
  end
  def edit
    @article = Article.find(params[:id])        
  end
  def update
    @article = Article.find(params[:id])  
    if @article.update(id: params[:id], name: params[:article][:name], body: params[:article][:body])
      redirect_to articles_path
    else
      render :edit
    end
  end
  def delete
    @article = Article.find(params[:id])  
    if @article.destroy
        redirect_to articles_path
    else
        render :edit
    end
  end
  private
  #strong parameter
  def article_params
    params.require(:article).permit(:name, :body)
  end
end