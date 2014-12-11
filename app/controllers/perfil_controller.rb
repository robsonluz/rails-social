class PerfilController < ApplicationController
	respond_to :json
	
	def adicionarAmigo
		perfil = Perfil.find(session[:perfilLogado])
		amigo = Perfil.find(params[:perfilId])

		
		unless amigo.amigosAprovacao.include?(perfil)
		   amigo.amigosAprovacao << perfil
		   amigo.save
		end		
		

		@message = Hash.new 
		@message["message"] = "ok"
		respond_with(@message)  
	end

	def solicitacoesAmizade
		perfil = Perfil.find(session[:perfilLogado])
		render :json => perfil.amigosAprovacao.to_json(), :callback => params['callback']
	end

	def amigos
		perfil = Perfil.find(session[:perfilLogado])
		render :json => perfil.amigos.to_json(), :callback => params['callback']
	end

	def aceitarAmizade
		perfil = Perfil.find(session[:perfilLogado])
		amigo = Perfil.find(params[:perfilId])

		
		unless perfil.amigos.include?(amigo)
		   perfil.amigos << amigo
		   amigo.amigos << perfil
		   perfil.amigosAprovacao.delete(amigo)
		   perfil.save
		end		
		

		@message = Hash.new 
		@message["message"] = "ok"
		respond_with(@message)  
	end

	def naoAceitarAmizade

		perfil = Perfil.find(session[:perfilLogado])
		amigo = Perfil.find(params[:perfilId])

		perfil.amigosAprovacao.delete(amigo)
		perfil.save

		@message = Hash.new 
		@message["message"] = "ok"
		respond_with(@message)  

	end

	def removerAmizade
		perfil = Perfil.find(session[:perfilLogado])
		amigo = Perfil.find(params[:perfilId])

		perfil.amigos.delete(amigo)
		amigo.amigos.delete(perfil)

		perfil.save()
		amigo.save()
		

		@message = Hash.new 
		@message["message"] = "ok"
		respond_with(@message)  

	end
end
