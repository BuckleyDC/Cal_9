class Event < ActiveRecord::Base
	default_scope { order('EventDate DESC')}


	def self.search_for(query, query_2) 
       where(:EventDate => @query..@query_2)
    end  
end
