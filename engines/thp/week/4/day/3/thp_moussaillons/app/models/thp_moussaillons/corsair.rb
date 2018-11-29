module ThpMoussaillons
  class Corsair < ApplicationRecord
    validates :first_name, :age,  presence: true
  end
end

# rails g model corsair first_name:string age:integer likeness:string bio:string slack_handle:string github_handle:string
