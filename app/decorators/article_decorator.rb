module ArticleDecorator
  def author_name
    user.display_name
  end

  def like_count
    likes.count
  end

  def display_created_at
    I18n.l(self.created_at, format: :long)
  end
end