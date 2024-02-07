class HomeController < ApplicationController
  def index
    # Article.firstでArticleテーブルの一番最初のレコードを取得
    @article = Article.first
    # テンプレート側で「開始タグ <%= @インスタンス変数名 %> 終了タグ」で呼び出す
    render "home/index"
  end

  def about
    @title = "aboutページです"
    render "home/about"
  end
end