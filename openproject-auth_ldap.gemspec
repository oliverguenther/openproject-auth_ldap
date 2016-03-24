# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/auth_ldap/version'
Gem::Specification.new do |s|
  s.name        = "openproject-auth_ldap"
  s.version     = OpenProject::AuthLdap::VERSION
  s.authors     = "Oliver Günther"
  s.email       = "mail@oliverguenther.de"
  s.homepage    = "https://github.com/hostsharing/openproject-auth_ldap"
  s.summary     = 'OmniAuth LDAP Strategy'
  s.description = 'Adds the OmniAuth LDAP provider strategy to OpenProject'
  s.license     = 'GPL-3'

  s.files = Dir["lib/**/*"] + %w(README.md)


  s.add_dependency "omniauth-ldap", "~> 1.0.4"
end
