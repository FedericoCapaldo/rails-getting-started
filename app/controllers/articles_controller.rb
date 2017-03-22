 class ArticlesController < ApplicationController
  # ask to be authenticated in order to do operations on the articles
  http_basic_authenticate_with name: "dhh", password: "secret", expect: [:index, :show]

  # this displayes the index view with all articles.
  def index
     @articles = Article.all
  end

  # this action requires its own view
  # show it's for one article
  def show
    @article = Article.find(params[:id])
  end

  # it has its own view
  def new
    # after insterting the error checking @article.errors.any?, this line is needed to prevent error of the app
    @article = Article.new
  end

  # it has its own view
  def edit
    @article = Article.find(params[:id])
  end

  # this is somehow called when the new.html.erb has a form that submits something
  def create
    @article = Article.new(article_params)

    # redirect_to is a new request. render keeps the @article object in the form
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  #  a view is not needed for this action since we are redirecting to the index action
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    # needed for security purpose to specify which parameters are allowed in the db
    def article_params
      params.require(:article).permit(:title, :text)
    end


end
