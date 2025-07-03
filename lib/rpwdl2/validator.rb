#frozen_string_literal: true
require 'pry'
module Rpwdl2
  module Validator
    class InvalidParameter < StandardError; end
    class InvalidRequestBody < StandardError; end
    class << self

       #         {
        #   "unikalnyIdentyfikatorKsiegi": {
        #     "typIdentyfikatora": "healthcare_provider_nip",
        #     "wartoscIdentyfikatora": "000000000001"
        #   }
        # }
      def validate_ordering_provider(requestBody)
        raise InvalidRquestBody, "Request Body nie jest hashem!" unless requestBody.is_a?(Hash)
        requestBodyParameter = requestBody["unikalnyIdentyfikatorKsiegi"]["typIdentyfikatora"]
        raise InvalidParameter, "Brak numeru NIP lub numeru księgi w parametrach." if requestBodyParameter != "healthcare_provider_nip" && requestBodyParameter != "ledger_number"
      end
    end
  end
end