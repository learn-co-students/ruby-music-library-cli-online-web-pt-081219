require 'bundler'
Bundler.require
require_relative '../lib/concerns/Findable.rb'
require_relative '../lib/concerns/Persistable.rb'

module Concerns
end

require_all 'lib'
