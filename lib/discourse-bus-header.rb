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
    MessageBus.user_id_lookup do |env|
        if env['REQUEST_METHOD'] == ('OPTIONS') && env['HTTP_ACCESS_CONTROL_REQUEST_METHOD']
            env["__mb"][:user_id] = -1
        end
    end
rescue LoadError
    puts 'Message Bus is not loaded, plugin Message bus header failed'
end
  
