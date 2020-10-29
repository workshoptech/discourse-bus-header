begin
    require 'message_bus'
    after_initialize do
        puts 'Message Bus Plugin'
        if SiteSetting.discourse_server_environment
            puts 'Add message bus header'
            MessageBus.extra_response_headers_lookup do |env|
                [
                    ["Access-Control-Allow-Origin", SiteSetting.discourse_server_environment],
                ]
            end
        end
    end
rescue LoadError
    puts 'Message Bus is not loaded, plugin Message bus header failed'
end
  
