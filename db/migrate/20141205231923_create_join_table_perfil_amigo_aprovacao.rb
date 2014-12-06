class CreateJoinTablePerfilAmigoAprovacao < ActiveRecord::Migration
  def change
	create_table "perfil_amigo_aprovacao", :force => true, :id => false do |t|
	  t.integer "perfil_a_id", :null => false
	  t.integer "perfil_b_id", :null => false
	end
  end
end
