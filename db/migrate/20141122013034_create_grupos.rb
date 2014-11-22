class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :nome
      t.string :descricao
      t.string :foto

      t.timestamps
    end
  end
end
