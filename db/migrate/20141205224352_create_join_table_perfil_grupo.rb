class CreateJoinTablePerfilGrupo < ActiveRecord::Migration
  def change
    create_join_table :perfils, :grupos do |t|
      # t.index [:perfil_id, :grupo_id]
      # t.index [:grupo_id, :perfil_id]
    end
  end
end
