require 'rack'
require 'active_support/core_ext/object'
require 'sofatutor/search_sniffer/version'
require 'sofatutor/search_sniffer/referring_search'
require 'sofatutor/search_sniffer/controller_methods'

if defined? ::Rails
  ActionController::Base.send :include, Sofatutor::SearchSniffer::ControllerMethods
end
