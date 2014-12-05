class AddPostRefToComentarios < ActiveRecord::Migration
  def change
    add_reference :comentarios, :post, index: true
  end
end
