class AddPerfilRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :perfil, index: true
  end
end
