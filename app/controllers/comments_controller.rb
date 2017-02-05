class CommentsController < ApplicationController

  def create
    # in this way the comment belongs straight away to a specific article
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    # 'controller'_path('object') it's an helper and it will call the show.html.erb view of the 'controller' called
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
