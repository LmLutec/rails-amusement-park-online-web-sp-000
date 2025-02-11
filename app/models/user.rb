class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides 

    has_secure_password


    def mood 
        if nausea && happiness
            if self.nausea > self.happiness
                return "sad"
            elsif self.happiness > self.nausea 
                return "happy"
            end 
        end  
    end 

end
