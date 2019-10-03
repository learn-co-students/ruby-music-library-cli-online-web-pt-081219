module Persistable
  module ClassMethods
    def destroy_all
      all.clear
    end

    def create(name)
      a = self.new(name)
      a.save
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
      self
    end
  end 
end