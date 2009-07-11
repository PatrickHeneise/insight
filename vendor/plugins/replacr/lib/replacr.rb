# Author::   Patrick Heneise (http://github.com/pathe/)
# Copyright:: Copyright (c) 2009 Patrick Heneise
# License::   MIT
require 'yaml'

module Replacr
  def self.load!
    @@file = {}
    base_path = "#{RAILS_ROOT}/config/replace.yml"
    @@file = YAML.load_file(base_path)
  end
  
	def self.get(key)
		value = @@file[key]
	end  
end

module ActionView
	module Helpers
		def replace(key)
      Replacr.load! if RAILS_ENV == 'development'
      Replacr.get(key)
    end
		alias :r :replace
  end
end