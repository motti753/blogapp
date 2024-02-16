class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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

  private
  def article_params
    puts '----'
    puts params
    puts '----'
    params.require(:article).permit(:title, :content)
  end
end