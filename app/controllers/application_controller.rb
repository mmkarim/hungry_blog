class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_action :set_locale

  # def default_url_options(options={})
  #   { locale: I18n.locale }
  # end

  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  def valid_jwt? jwt
    email = Auth.decode(jwt)["email"]
    if admin_signed_in? && current_admin.email == email
      true
    else
      false
    end
  end
end
