class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(commnets_params)
    if @comment.save
      redirect_to article_path(article.id), notice: 'コメントを保存できました'
    else
      flash.now[:error] = 'コメントを保存できません。コメント内容を確認ください'
      render :new
    end
  end

  private
  def commnets_params
    params.require(:comment).permit(:content)
  end

end