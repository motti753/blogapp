require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Article', type: :system do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }

  # article index
  it '記事一覧が表示される' do
    visit root_path
    articles.each do |article|
      # pageにartilce最初のタイトルが存在しているか
      # expect(page).to have_content(article.title)
      # pageの.card_titleクラスにarticle.titleが存在するか
      expect(page).to have_css('.card_title', text: article.title)
    end
  end

  # article show
  it '記事の詳細を表示できる' do
    visit root_path

    article = articles.first
    click_on articles.first.title

    # .article_titleクラス要素にarticle.titleが存在すること
    expect(page).to have_css('.article_title', text: article.title)
    # .article_cotentクラス要素にarticle.contentが存在すること
    # to_plain_textはactionDecorationで変換されているものを文字列に直したもの
    expect(page).to have_css('.article_content', text: article.content.to_plain_text)
  end
end