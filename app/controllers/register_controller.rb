class RegisterController < ApplicationController
  respond_to :json

  def save

  	p = Perfil.where(email: params[:email]).first

  	if(p) 
		@message = Hash.new 
		@message["message"] = "Usuário já cadastrado!"
  		respond_with @message, :location => root_url
	else
	  	@perfil = Perfil.new()
	  	@perfil.nome = params[:nome]
	  	@perfil.email = params[:email]
	  	@perfil.senha = params[:senha]
	  	@perfil.foto = "default.jpg"

	  	@perfil.save

		respond_with @perfil, :location => root_url
	end
	
=begin
  	perfis = Perfil.all

  	for perfil in perfis
  		print perfil.nome
  	end
=end


=begin
	perfil = Perfil.find(1)
	print perfil.posts
	perfil.posts.each do |post|
		print post.texto
	end
=end


=begin
	#novo post com perfil associaco
	perfil = Perfil.find(1)

	post = Post.new()
	post.texto = "Quarto post"
	post.perfil = perfil

	post.save
=end	



  end
end
