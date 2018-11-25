module BaseDeDonnees
	class Cour < ApplicationRecord
		has_many :lecons
	end
end
