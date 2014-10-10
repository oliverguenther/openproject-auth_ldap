# OpenProject OmniAuth LDAP Strategy Provider

This plugin provides the [OmniAuth LDAP Strategy](https://github.com/intridea/omniauth-ldap) for OpenProject.

## Installation

Add the following entries to your `Gemfile.plugins` in your OpenProject (4.0+) root directory:

	gem 'openproject-auth_plugins', :git => 'https://github.com/opf/openproject-auth_plugins', :branch => 'stable'
	gem "openproject-auth_ldap", :git => 'https://github.com/hostsharing/openproject-auth_ldap', :branch => 'stable'

## Requirements

* [omniauth-ldap gem](https://github.com/intridea/omniauth-ldap) ~> 1.0.4
* [OpenProject](http://openproject.org) >= 4.0
* [openproject-auth](https://github.com/opf/openproject-auth_plugins)


## Configuration

To add your own LDAP strategy provider(s), create the following settings file (relative to your OpenProject root):

	config/plugins/auth_ldap/settings.yml
	
with the following contents:

	myldap:
	  name: "my-ldap"
	  host: 'localhost'
	  port: 389
	  base: 'dc=example, dc=com'
	  filter: '(&(uid=%{username})(memberOf=cn=myapp-users,ou=groups,dc=example,dc=com))'
	  uid: 'uid'
	  display_name: "LDAP"

 - `uid` specifies the LDAP attribute that is used as the username field in the login form.
 - `display_name` is the name of the omniauth login scheme as displayed to the user.
 - `name` attribute identifies the authentication scheme (e.g., it is used for the auth route /auth/<name>/)
 - An optional `icon` may be set to an asset path which will override the default   OpenProject authentication icon (defaults to two meshing cogwheels).

The plugin simply passes all options to omniauth-ldap. See [their documentation](https://github.com/intridea/omniauth-ldap) for all available configuration keys.

### Multiple Providers

If you have the use-case of multiple LDAP providers, simply add several providers to your yaml config, OpenProject will handle the rest automatically.

## Copyrights & License
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

Copyright (c) 2014 Oliver Günther (mail@oliverguenther.de)
The initial development of this OpenProject plugin was funded by Hostsharing eG ([www.hostsharing.net](www.hostsharing.net)).
