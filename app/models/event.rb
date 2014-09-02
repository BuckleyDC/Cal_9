class Event < ActiveRecord::Base
	default_scope { order('EventDate DESC')}


	def self.search_for(query)                                                       
       where('EventDate LIKE :query', :query => "%#{query}%") 
    end  
end
