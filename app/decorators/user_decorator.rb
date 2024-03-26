# frozen_string_literal: true

module UserDecorator
  def display_name
    # if profile && profile.nickname
    #   profile.nickname
    # else
    #   self.email.split('@').first
    # end

    # &.ぼっち演算子:nillでない場合、nicknameを返す
    profile&.nickname || self.email.split('@').first
  end

  def avatar_image
    # profileデータがある and profile.avatarがある
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end
end
