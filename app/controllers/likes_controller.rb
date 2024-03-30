class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    article = Article.find(params[:article_id])
    @likes = article.likes.create!(user_id: current_user.id)
    redirect_to article_path(article)
  end

  def destroy
    article = Article.find(params[:article_id])
    like = article.likes.find_by!(user_id: current_user.id)
    like.destroy!
    redirect_to article_path(article)
  end

  # GET /article/1/like
  def show
    article = Article.find(params[:article_id])
    like_status = current_user.has_liked?(article)
    render json: { hasLiked: like_status }
  end
end