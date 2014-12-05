class AddPerfilRefToComentarios < ActiveRecord::Migration
  def change
    add_reference :comentarios, :perfil, index: true
  end
end
