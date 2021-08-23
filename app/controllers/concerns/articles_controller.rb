class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
  if @article.save
    flash[:success] = "Article was successfully created"
    redirect_to article_path(@article)
  else
   render 'new'
  end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
  if @article.update(article_params)
    flash[:success] = "Article was updated"
    redirect_to article_path(@article)
  else
    flash[:success] = "Article was not updated"
    render 'edit'
  end
  end

  def destroy
    @article = Article.find(params[:id])
  if @article.user == current_user
    @article.destroy
    flash[:success] = "Article was deleted"
    redirect_to articles_path
  else
    flash[:danger] = "User Can only delete his/her own Article"
    redirect_to articles_path
  end
  end

private
  def article_params
   params.require(:article).permit(:title, :description)
  end
end
