# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  # validates :title, presence: true, length: { minimum: 2, maximun: 100},
  # format: {with: /\A(?!\@)/}
  # validates :title, length: { minimum: 2}

  # validates :content, presence: true, length: {minimum: 5}, uniqueness: true
  # validates :content, length: {minimum: 10}

  # validate 独自のルール 単数系で宣言する
  # validate :validate_title_and_content_length

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :eyecatch
  has_rich_text :content

  private
  def validate_title_and_content_length
    char_count = self.title.length + self.content.length
    unless char_count > 100
      errors.add(:content, '100文字以上で！')
    end
  end
end
