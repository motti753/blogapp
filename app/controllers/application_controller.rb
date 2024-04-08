class ApplicationController < ActionController::Base
  before_action :set_locale

  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private
  def set_locale
    # 言語を切り替える
    I18n.locale = params[:locale] || I18n.default_locale
  end
end

# /articles/1 => params[:id]
# /articles/?id=1 => params[:id]
