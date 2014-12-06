class PerfilController < ApplicationController
	respond_to :json
	def adicionarAmigo
		perfil = Perfil.find(session[:perfilLogado])
		amigo = Perfil.find(params[:perfilId])

		
		unless perfil.amigos.include?(amigo)
		   perfil.amigos << amigo
		   perfil.save
		end		
		

		@message = Hash.new 
		@message["message"] = "ok"
		respond_with(@message)  
	end
end
