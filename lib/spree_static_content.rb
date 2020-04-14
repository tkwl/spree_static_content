require 'spree_core'
require 'spree_static_content/engine'
require 'coffee_script'
require 'sass/rails'

module StaticPage
  def self.remove_spree_mount_point(path)
    regex = Regexp.new '\A' + Rails.application.routes.url_helpers.spree_path
    path.sub( regex, '').split('?')[0]
  end
end

class Spree::StaticPage
  def self.matches?(request)
    path = request.path_parameters[:path]
      return false if path =~ %r{\A+(admin|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|user)+}
      !self.finder_scope.find_by(slug: [path, "/#{path}"]).nil?
    
    Spree::Page.visible.find_by(slug: request.path).nil?
  end
end
