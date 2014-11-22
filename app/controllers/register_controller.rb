class RegisterController < ApplicationController
	Rails.logger = Logger.new(STDOUT)

  def save
=begin
  	perfil = Perfil.new()
  	perfil.nome = "Robson Joao"
  	perfil.email = "robson.luz@bomjesus.br"
  	perfil.senha = "12345"
  	perfil.foto = "default.jpg"

  	perfil.save
=end

  	perfis = Perfil.all

  	for perfil in perfis
  		print perfil.nome
  	end
  end
end
