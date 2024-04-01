class CommentsController < ApplicationController
  def index
    article = Article.find(params[:article_id])
    comments = article.comments
    render json:comments
  end

  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(commnet_params)
    if @comment.save
      redirect_to article_path(article.id), notice: 'コメントを保存できました', status: :see_other
    else
      flash.now[:error] = 'コメントを保存できません。コメント内容を確認ください'
      render :new
    end
  end

  private
  def commnet_params
    params.require(:comment).permit(:content)
  end

end