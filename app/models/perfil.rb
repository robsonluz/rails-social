class Perfil < ActiveRecord::Base
	has_many :posts
	has_and_belongs_to_many :grupos

	has_and_belongs_to_many :amigos, class_name: "Perfil", join_table: "perfil_amigo", :foreign_key => "perfil_a_id", :association_foreign_key => "perfil_b_id"
	has_and_belongs_to_many :amigosAprovacao, class_name: "Perfil", join_table: "perfil_amigo_aprovacao", :foreign_key => "perfil_a_id", :association_foreign_key => "perfil_b_id"
end
