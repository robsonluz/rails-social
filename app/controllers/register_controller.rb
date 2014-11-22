class RegisterController < ApplicationController


  def save
=begin
  	perfil = Perfil.new()
  	perfil.nome = "Robson Joao"
  	perfil.email = "robson.luz@bomjesus.br"
  	perfil.senha = "12345"
  	perfil.foto = "default.jpg"

  	perfil.save
=end


	
=begin
  	perfis = Perfil.all

  	for perfil in perfis
  		print perfil.nome
  	end
=end


	perfil = Perfil.find(1)
	print perfil.posts
	perfil.posts.each do |post|
		print post.texto
	end

=begin 
	#novo post com perfil associaco
	perfil = Perfil.find(1)

	post = Post.new()
	post.texto = "Primeiro post"
	post.perfil = perfil

	post.save
	

=end

  end
end
