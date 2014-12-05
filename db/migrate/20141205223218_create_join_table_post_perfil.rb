class CreateJoinTablePostPerfil < ActiveRecord::Migration
  def change
    create_join_table :posts, :perfils, table_name: :post_perfil_curtida do |t|
      # t.index [:post_id, :perfil_id]
      # t.index [:perfil_id, :post_id]
    end
  end
end
