# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :代替え名, through: :中間テーブル, source: :代替え名のテーブル
  # 上記でuserテーブルからlikesテーブルをスルーしてarticleレコードを取得できる
  has_many :favorite_articles, through: :likes, source: :article

  # 自分がフォローしている人を探し出す
  # has_many :代替え名, foreign_key: 'カラム名', class_name: 'テーブル名', dependent: :destroy
  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  # user.followingsとすると、「自身のuser_id = follower_id」となっているレコードのfollowingカラムを取得する
  has_many :followings, through: :following_relationships, source: :following

  # 自分のフォロワーを探し出す
  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  # user.followingsとすると、「自身のuser_id = follower_id」となっているレコードのfollowingカラムを取得する
  has_many :followers, through: :follower_relationships, source: :follower

  # 指定テーブルのカラムを取ってくる。def メソッドの定義が不要になる。
  # delegate :カラム名①, :カラム名②, to: :テーブル名, allow_nil: true
  delegate :birthday, :gender, :age, to: :profile, allow_nil: true

  def has_written?(article)
    articles.exists?(id: article.id)
  end

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  def display_name
    # if profile && profile.nickname
    #   profile.nickname
    # else
    #   self.email.split('@').first
    # end

    # &.ぼっち演算子:nillでない場合、nicknameを返す
    profile&.nickname || self.email.split('@').first
  end

  # def birthday
  #   profile&.birthday
  # end

  # def gender
  #   profile&.gender
  # end

  # ユーザに紐づくプロフィールがある場合、表示。
  # ない場合、新たにレコードを作成する
  def prepare_profile
    profile || build_profile
  end

  def avatar_image
    # profileデータがある and profile.avatarがある
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

  def follow!(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow!(user)
    relation = following_relationships.find_by!(following_id: user.id)
    relation.destroy!
  end
end
