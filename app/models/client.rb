class Client < ActiveRecord::Base

    has_many :items
    has_many :events
    
end
