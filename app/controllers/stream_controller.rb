class StreamController < ApplicationController
  respond_to :json

  def index
  	
	perfilId = session[:perfilLogado]

	if(perfilId)

	  	@posts = Post.where(perfil_id: perfilId, grupo_id: nil).order("created_at DESC")

	  	render :json => @posts.to_json(
	  		  
  			:include => [ 
  				:perfil ,
  				:curtidas,
  				{ :comentarios =>  { :include => :perfil } } 
  			]

	  	), :callback => params['callback']
	else
		@message = Hash.new 
		@message["message"] = "nao logado"
  		respond_with(@message)		
  	end
  end

  def create

	perfilId = session[:perfilLogado]
	if(perfilId)

		perfil = Perfil.find(perfilId)

		@post = Post.new()
		@post.texto = params[:texto]
		if(params[:grupoId])
			grupo = Grupo.find(params[:grupoId])
			@post.grupo = grupo
		end
		@post.perfil = perfil

		@post.save

		#@message = Hash.new 
		#@message["message"] = "teste"
  		#respond_with(@post)
  		render :json => @post.to_json(:include => :perfil), :callback => params['callback']
  	end

  end


  def createComentario
	@comentario = Comentario.new()
	@comentario.texto = params[:texto]
	@comentario.post = Post.find(params[:postId])
	@comentario.perfil = Perfil.find(session[:perfilLogado])

	@comentario.save

	render :json => @comentario.to_json(:include => :perfil), :callback => params['callback']

  end

  def curtir
  	post = Post.find(params[:postId])
  	perfil = Perfil.find(session[:perfilLogado])


	unless post.curtidas.include?(perfil)
		post.curtidas << perfil
	  	post.save
	end		
  	

	@message = Hash.new 
	@message["message"] = "ok"
	respond_with(@message)  	

  end

end
