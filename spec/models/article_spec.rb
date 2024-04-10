require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'タイトルと内容が入力されていれば、記事を保存できる' do
    user = User.create!({
      email: 'aaaaaa@gmail.com',
      password: 'password'
    })

    article = user.articles.build({
      title: Faker::Games::Pokemon.name,
      content: Faker::Games::Pokemon.location
    })
    # expect=期待する articleがto be_valid=保存できること
    expect(article).to be_valid
  end
end
