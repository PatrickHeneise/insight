require 'replacr'

ActionView::Base.send :include, Replacr

Replacr.load!