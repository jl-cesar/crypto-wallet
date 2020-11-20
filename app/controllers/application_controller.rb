class ApplicationController < ActionController::Base
    # ENABLE IT FOR USE POSTMAN REQUESTS!
    # protect_from_forgery with: :null_session 
    before_action :set_locale

    private
    def set_locale
        cookies[:locale] = params[:locale] if params.dig(:locale)

        if cookies[:locale] && I18n.locale != cookies[:locale]
            I18n.locale = cookies[:locale]
        end
    end
end
