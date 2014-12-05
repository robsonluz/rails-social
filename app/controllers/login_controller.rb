class LoginController < ApplicationController
  respond_to :json

  def login
  	email = params[:email]
  	senha = params[:senha]

  	@perfil = Perfil.where(email: email,  senha: senha).first
  	if(@perfil)
  		print "logado: "
  		print @perfil.id

  		session[:perfilLogado] = @perfil.id
		  respond_with(@perfil)  		
=begin
  		@message = Hash.new 
  		@message["message"] = "E-mail e ou senha inválidos!"
    		respond_with(@message)
=end

  	else

		@message = Hash.new 
		@message["message"] = "E-mail e ou senha inválidos!"
  		respond_with(@message)
  	end
  	
  end
end
