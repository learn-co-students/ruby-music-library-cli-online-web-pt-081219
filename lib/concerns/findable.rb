require 'pry'
module Concerns
  module Findable
   
    def find_by_name(name)
      target = self.all.select{|target| target.name == name}
      target[0]
    end
  
    def find_or_create_by_name(name)
      if  self.find_by_name(name) == nil
        #binding.pry
        self.create(name)
      else 
        self.find_by_name(name)
      end
    end
  end
end