module Reservation
  class Appointment < ApplicationRecord
        belongs_to :doctor
        belongs_to :patient
  end
end
