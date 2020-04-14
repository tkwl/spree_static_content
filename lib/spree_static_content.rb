require 'spree_core'
require 'spree_static_content/engine'
require 'coffee_script'
require 'sass/rails'
require 'spree_static_content/version'


module StaticPage
  module_function

  def remove_spree_mount_point(path)
    regex = Regexp.new '\A' + Rails.application.routes.url_helpers.spree_path
    path.sub(regex, '').split('?')[0]
  end
end

module Spree
  class StaticPage
    def self.matches?(request)
      path = request.path_parameters[:path]
      return false if path =~ %r{\A+(admin|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|user)+}
      !self.finder_scope.find_by(slug: [path, "/#{path}"]).nil?
    end

    protected

    def self.finder_scope
      scope = Spree::Page.visible
      scope = scope.joins(:translations) if defined?(SpreeGlobalize)
      scope
    end
  end
end