module Concerns
  module Findable 
    def find_by_name(name)
      all.detect { |item| item.name == name }
    end
  
    def find_or_create_by_name(query)
      result = find_by_name(query)
      if result.nil?
        create(query)
      else
        result
      end
    end
  end
end
