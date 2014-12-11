class GrupoController < ApplicationController
  respond_to :json

  #lista os grupos do usuario
  def index
	perfilId = session[:perfilLogado]

	if(perfilId)
		perfil = Perfil.find(perfilId)

		render :json => perfil.grupos.to_json(), :callback => params['callback']
	end
  end

  def lista
  	grupos = Grupo.all()
  	render :json => grupos.to_json(), :callback => params['callback']
  end

  def entrar
	perfilId = session[:perfilLogado]

	if(perfilId)
		perfil = Perfil.find(perfilId)
		grupo = Grupo.find(params[:grupoId])
		if(grupo)
			unless grupo.perfils.include?(perfil)
			   grupo.perfils << perfil
			   grupo.save
			end				
		end

		render :json => perfil.grupos.to_json(), :callback => params['callback']
	end  	
  end

  def sair
	perfilId = session[:perfilLogado]

	if(perfilId)
		perfil = Perfil.find(perfilId)
		grupo = Grupo.find(params[:grupoId])
		if(grupo)
			grupo.perfils.delete(perfil);
			grupo.save
		end

		render :json => perfil.grupos.to_json(), :callback => params['callback']
	end  	
  end  


  def create
	perfilId = session[:perfilLogado]
	if(perfilId)

		perfil = Perfil.find(perfilId)

		grupo = Grupo.new()
		grupo.nome = params[:nome]
		grupo.foto = "grupo.png"
		grupo.descricao = params[:descricao]

		unless grupo.perfils.include?(perfil)
		   grupo.perfils << perfil
		end				

		grupo.save

  		render :json => grupo.to_json(), :callback => params['callback']
  	end  	
  end

  def posts

	grupo = Grupo.find(params[:grupoId])

  	render :json => grupo.posts.to_json(
  		  
			:include => [ 
				:perfil ,
				:curtidas,
				{ :comentarios =>  { :include => :perfil } } 
			]

  	), :callback => params['callback']

  end


end
