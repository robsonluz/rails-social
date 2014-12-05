class AddGrupoRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :grupo, index: true
  end
end
