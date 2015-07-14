class ApplicationController < ActionController::Base
  before_filter :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = extract_locale
  end

  private

  def extract_locale
    case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}(?:\-[a-zA-Z]{2})?/).first
      when 'en-GB'
        'en-GB'
      when 'en-US'
        'en'
      when 'en'
        'en'
      else
        'en'
    end
  end
end
