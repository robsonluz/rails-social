class Perfil < ActiveRecord::Base
	has_many :posts
	has_and_belongs_to_many :grupos

end
