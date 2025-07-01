# frozen_string_literal: true
require 'faraday'
require 'pry'
module Rpwdl2
    class Client
        attr_reader :api_key, :base_url, :timeout, :logger, :connection

        def initialize(api_key: nil, base_url: nil, timeout: 900, logger:nil)
            @api_key = api_key
            @base_url = base_url
            @timeout = timeout
            @logger = logger
            @connection = build_connection
        end

        def get_ordering_provider(body, params: nil)
            Rpwdl2::Validator.validate_ordering_provider(body)
            make_request("/podmioty/ksiegi-rejestrowe/szukaj-jeden", body)
        end

        def get_referring_physician(params)

        end


        private
            def build_connection
                Faraday.new(url: base_url) do |c|
                    c.request :json
                    c.options.timeout = timeout
                    c.adapter Faraday.default_adapter
                    c.headers = {
                        'Content-Type' => "application/json"
                    }
                end
            end

            def make_request(url, body, params: {})
                
            # domyslnie post
                response = connection.post(url) do |req|
                    req.body = body if body
                    req.params = params if params.any?
                end
                binding.pry
            end
    end
end