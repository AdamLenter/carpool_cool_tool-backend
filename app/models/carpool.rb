class Carpool < ActiveRecord::Base
    belongs_to :origin_location, :class_name => 'Location'
    belongs_to :destination_location, :class_name => 'Location'
    belongs_to :driver_user, :class_name => 'User'
    has_many :carpool_guests
end