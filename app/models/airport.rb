class Airport < ApplicationRecord
    validates_uniqueness_of :code

    has_many :departures, class_name: "Flight", foreign_key: "departure_airport_id"
    has_many :arrivals, class_name: "Flight", foreign_key: "arrival_airport_id"
end
