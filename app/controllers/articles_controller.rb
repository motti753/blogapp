class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # 記述した位置で処理を止める。ターミナル内で値確認ができる。抜けるにはexit
  # binding.pry
  # 強制的にエラーにするコマンド
  # rails StandardError

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article.id), notice: '保存できました'
    else
      flash.now[:error] = '保存できません。タイトルと内容を確かめてください'
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy!
    # redirect_to root_path, notice: '削除に成功しました'
    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
