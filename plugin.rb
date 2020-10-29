# name: discourse-bus-header
# about: Adding extra headers for message bus
# version: 0.0.1
# authors: Max Ptz

enabled_site_setting :discourse_bus_header_enabled
enabled_site_setting :discourse_server_environment

PLUGIN_NAME ||= 'DiscourseBusHeader'

after_initialize do
    puts 'Message Bus Plugin'
    if SiteSetting.discourse_bus_header_enabled
        load File.expand_path('lib/discourse-bus-header.rb', __dir__)   
    end
end