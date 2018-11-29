module Generate
  class Stroll < ApplicationRecord
    belongs_to :dogsitter
    belongs_to :dog
  end
end
