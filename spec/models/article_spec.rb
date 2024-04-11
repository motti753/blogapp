require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) do
    user = User.create!({
      email: 'aaaaaa@gmail.com',
      password: 'password'
    })
  end
  # 前提条件と動作内容を分ける時に使用する
  context 'タイトルと内容が入力されている場合' do
    # [let!(:変数名)]は、変数名 = xxxx;と同じ意味。 do~endの間が変数に代入する値
    let!(:article) do
      article = user.articles.build({
        title: Faker::Games::Pokemon.name,
        content: Faker::Games::Pokemon.location
      })
    end
    # 前提条件
    # before do
    #   user = User.create!({
    #     email: 'aaaaaa@gmail.com',
    #     password: 'password'
    #   })

    #   @article = user.articles.build({
    #     title: Faker::Games::Pokemon.name,
    #     content: Faker::Games::Pokemon.location
    #   })
    # end

    it '記事を保存できる' do
      # expect=期待する articleがto be_valid=保存できること
      expect(article).to be_valid
    end
  end

  context 'タイトルの文字が空白の場合' do
    let!(:article) do
      article = user.articles.create({
        title: 'a',
        content: Faker::Games::Pokemon.location
      })
    end

    it '記事を保存できない' do
      expect(article.errors.messages[:title][0]).to eq('は２文字以上で入力してください')
    end
  end
end
