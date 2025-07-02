# frozen_string_literal: true

require_relative "rpwdl2/version"
require_relative "rpwdl2/client"
require_relative "rpwdl2/validator"
module Rpwdl2
    class << self # ulatwienie zamiast pisac wszedzie w metodach def self.configuration to deklaruje i mam
        attr_accessor :api_key, :base_url

        def configure
            yield(self) if block_given?
        end

        def client
            @client ||= Http::Client.new(
                api_key: api_key,
                base_url: base_url
            )
        end


        def reset!
            @client = nil
            @api_key = nil
            @base_url = 'https://api.ezdrowie.gov.pl/rpwdl/'
        end

    end
end
