begin
    require 'message_bus'
    puts 'Add message bus header'
    MessageBus.extra_response_headers_lookup do |env|
        [
            ["Access-Control-Allow-Origin", SiteSetting.discourse_server_environment],
            ["Access-Control-Allow-Methods", 'POST'],
            ["Access-Control-Allow-Headers", '*'],
        ]
    end
rescue LoadError
    puts 'Message Bus is not loaded, plugin Message bus header failed'
end
  
