require 'bundler'
Bundler.require

module Concerns
    module Findable

        def find_by_name(name)
            ## this works because its "extended" as a class method
            all.detect{ |a| a.name == name }
        end

        def find_or_create_by_name(name)
            find_by_name(name) || create(name)
        end 

    end
end



require_all 'lib'
