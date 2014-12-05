class Post < ActiveRecord::Base
	belongs_to :perfil
	belongs_to :grupo
	has_many :comentarios

	has_and_belongs_to_many :curtidas, class_name: "Perfil", join_table: "post_perfil_curtida"
end
