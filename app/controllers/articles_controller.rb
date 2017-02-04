class ArticlesController < ApplicationController

  # this displayes the index view with all articles.
  def index
     @articles = Article.all
  end

  # this action requires its own view
  # show it's for one article
  def show
    @article = Article.find(params[:id])
  end

  # this is a view
  def new
  end

  # this is somehow called when the new.html.erb has a form that submits something
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  private
    # needed for security purpose to specify which parameters are allowed in the db
    def article_params
      params.require(:article).permit(:title, :text)
    end


end
