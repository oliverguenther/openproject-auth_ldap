require 'omniauth-ldap'

module OpenProject::AuthLdap
  class Engine < ::Rails::Engine
    engine_name :openproject_auth_ldap

    include OpenProject::Plugins::ActsAsOpEngine
    extend OpenProject::Plugins::AuthPlugin

    register 'openproject-auth_ldap',
             :author_url => 'https://github.com/hostsharing/openproject-auth_ldap',
             :requires_openproject => ">= 4.0.0"

    register_auth_providers do
      settings = Rails.root.join('config', 'plugins', 'auth_ldap', 'settings.yml')
      if (settings.exist?)
        providers = YAML::load(File.open(settings)).symbolize_keys
        strategy :ldap do
          providers.values.map(&:symbolize_keys)
        end
      else
        Rails.logger.warn("[auth_ldap] Missing settings from '#{settings}', skipping omniauth registration.")
      end
    end
  end
end
