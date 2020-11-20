module HomeHelper
    def show_welcome
        return "#{t('hello_user')}, #{cookies[:usuario_nome]}" if !cookies[:usuario_nome].empty? rescue t('hello_user')
    end
end
