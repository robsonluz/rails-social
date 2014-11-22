class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :nome
      t.text :foto
      t.text :sobre
      t.text :email
      t.text :senha

      t.timestamps
    end
  end
end
