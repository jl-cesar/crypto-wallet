class HomeController < ApplicationController
  def index
    cookies[:usuario_nome] = params[:nome] if params.dig(:nome) && !cookies[:usuario_nome] # Define o cookie usuario_nome (/?nome=:nome) se passado e nao existir
  end
end
