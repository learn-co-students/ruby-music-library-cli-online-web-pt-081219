require 'bundler'
Bundler.require

module Concerns
  
  module Findable
     
     def find_by_name(name)
       self.all.find{|el| el if el.name == name}
     end 
     
     def find_or_create_by_name(name)
       result = self.find_by_name(name)
       result ? result : self.create(name) 
     end
    
  end
  
  
  module Class_methods 
   
 
     def destroy_all 
      self.all.clear
     end
     
     def create(name) 
       new_object = self.new(name)
       new_object.save 
       new_object
     end
    
  end
  
  module Instance_methods
    def save 
       self.class.all << self if !self.class.all.include?(self)
    end
 
  end
end

require_all 'lib'
