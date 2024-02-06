class HomeController < ApplicationController
  def index
    # @インスタンス変数
    @title = "デイトラ"
    
    # テンプレート側で「開始タグ <%= @インスタンス変数名 %> 終了タグ」で呼び出す
    render "home/index"
  end
end