require 'rails_helper'

RSpec.describe 'Api::Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }
  let!(:comments) { create_list(:comment, 2, article: article) }

  describe 'GET /api/comments' do
    it '200ステータスが返ってくる' do
      puts 'コメント一覧が取得できるかテスト'
      puts comments[0].content
      puts comments[1].content
      get api_comments_path(article_id: article.id)
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
      expect(body.length).to eq 2
      expect(body[0]['content']).to eq comments.first.content
      expect(body[1]['content']).to eq comments.second.content
    end
  end
end
