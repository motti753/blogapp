require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let!(:user) {FactoryBot.create(:user)}
  # create_list(:articles, 記事数, user: user)で複数のダミーデータを生成
  let!(:articles) { FactoryBot.create_list(:article, 3, user: user) }

  # indexメソッドのテスト
  describe 'GET /articles' do
    it '200ステータスが返ってくる' do
      puts '記事一覧が取得できるかテスト'
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  # createメソッドのテスト
  describe 'POST /articles' do
    context 'ログインしている場合' do
      before do
        # rails_helper.rbにconfigの定義を追加することで使用可能となるメソッドsign_in
        sign_in user
      end

      it '記事が保存されている' do
        # attributes_forで{article: {title: xxxx, content:xxxx}}の形式に成形している
        article_params = attributes_for(:article)
        puts 'ログイン状態の記事保存テスト'
        puts article_params
        post articles_path({article: article_params})
        expect(response).to have_http_status(302)
        expect(Article.last.title).to eq(article_params[:title])
        expect(Article.last.content.body.to_plain_text).to eq(article_params[:content])
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        article_params = attributes_for(:article)
        puts 'ログインしていない状態の記事保存テスト'
        puts article_params
        post articles_path({article: article_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
