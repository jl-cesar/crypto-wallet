module ApplicationHelper
    def showEnv
        return "Você está em ambiente de desenvolvimento!" if Rails.env.development?
        return "Você está em ambiente de produção!" if Rails.env.production?
    end
end
