class Api::CommentsController < Api::ApplicationController
  def index
    article = Article.find(params[:article_id])
    comments = article.comments
    render json:comments
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(commnet_params)
    @comment.save!
    render json: @comment
    # jsでリクエストする
    # if @comment.save
    #   redirect_to article_path(article.id), notice: 'コメントを保存できました', status: :see_other
    # else
    #   flash.now[:error] = 'コメントを保存できません。コメント内容を確認ください'
    #   render :new
    # end
  end

  private
  def commnet_params
    params.require(:comment).permit(:content)
    # {comment: {content: 'ssss'}}
  end

end