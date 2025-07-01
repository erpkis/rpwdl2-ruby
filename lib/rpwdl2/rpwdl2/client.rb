# frozen_string_literal: true

module Rpwdl2
    class Client
        attr_reader :api_key, :base_url, :timeout, :logger, :connection

        def initialize(api_key: nil, base_url: nil, timeout: 30, logger:nil)
            @api_key = api_key
            @base_url = base_url
            @timeout = timeout
            @logger = logger
            @connection = build_connection
        end

        def get_ordering_provider(params)

        end

        def get_referring_physician(params)

        end


        private
            def build_connection
                Faraday.new(url: base_url) do |c|
                    c.request :json
                    c.options.timeout = timeout
                end
            end

            def make_request(operation, url, body, params: {})
                
                response = connection.public_send(operation) do |req|
                    req.url url
                    req.body body if body
                    req.params = params if params.any?
                end

            end
    end
end