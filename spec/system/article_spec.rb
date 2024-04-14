require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Article', type: :system do
  let!(:user) { create(:user) }
  let!(:articles) { create_list(:article, 3, user: user) }

  it '記事一覧が表示される' do
    visit root_path
    artilces.each do |article|
      # pageにartilce最初のタイトルが存在しているか
    expect(page).to have_content(artilce.title)
    end
  end
end