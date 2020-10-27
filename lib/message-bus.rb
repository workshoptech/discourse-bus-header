MessageBus.extra_response_headers_lookup do |env|
    [
        ["Access-Control-Allow-Origin", SiteSetting.discourse_server_environment],
    ]
  end