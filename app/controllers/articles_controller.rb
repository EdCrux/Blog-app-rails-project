class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]); 
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(white_list)
    if @article.save
      redirect_to :articles
    else
      render 'new'
    end
  end

  def white_list
    params.require(:article).permit(:title,:body)
  end


end
