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
      redirect_to(@article)
    else
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end

  private
  def white_list
    params.require(:article).permit(:title,:body)
  end


end
