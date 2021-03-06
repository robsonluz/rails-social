# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141205231923) do

  create_table "comentarios", force: true do |t|
    t.string   "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "perfil_id"
  end

  add_index "comentarios", ["perfil_id"], name: "index_comentarios_on_perfil_id"
  add_index "comentarios", ["post_id"], name: "index_comentarios_on_post_id"

  create_table "grupos", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.string   "foto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grupos_perfils", id: false, force: true do |t|
    t.integer "perfil_id", null: false
    t.integer "grupo_id",  null: false
  end

  create_table "perfil_amigo", id: false, force: true do |t|
    t.integer "perfil_a_id", null: false
    t.integer "perfil_b_id", null: false
  end

  create_table "perfil_amigo_aprovacao", id: false, force: true do |t|
    t.integer "perfil_a_id", null: false
    t.integer "perfil_b_id", null: false
  end

  create_table "perfils", force: true do |t|
    t.string   "nome"
    t.text     "foto"
    t.text     "sobre"
    t.text     "email"
    t.text     "senha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_perfil_curtida", id: false, force: true do |t|
    t.integer "post_id",   null: false
    t.integer "perfil_id", null: false
  end

  create_table "posts", force: true do |t|
    t.string   "texto"
    t.string   "imagem"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "perfil_id"
    t.integer  "grupo_id"
  end

  add_index "posts", ["grupo_id"], name: "index_posts_on_grupo_id"
  add_index "posts", ["perfil_id"], name: "index_posts_on_perfil_id"

end
