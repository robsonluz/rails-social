class CreateJoinTablePerfilAmigo < ActiveRecord::Migration
  def change
    #create_join_table :perfils, :perfils, table_name: :perfil_amigo do |t|
      # t.index [:perfil_id, :perfil_id]
      # t.index [:perfil_id, :perfil_id]
    #end

	create_table "perfil_amigo", :force => true, :id => false do |t|
	  t.integer "perfil_a_id", :null => false
	  t.integer "perfil_b_id", :null => false
	end

  end
end
