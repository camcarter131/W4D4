class Band < ApplicationRecord
    validates :name, presence: true

    def self.find_by_credentials(name) #Sees if a band in the database has the specified name
        band = Band.find_by(name: name)
        if band 
            band
        else
            nil
        end
    end


end
