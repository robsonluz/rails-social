class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :texto
      t.string :imagem

      t.timestamps
    end
  end
end
