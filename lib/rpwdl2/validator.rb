#frozen_string_literal: true

module Rpwdl2
  module Validator
    class InvalidParameter < StandardError; end
    class << self

      def validate_ordering_provider(params)
        raise InvalidParameter, "Brak NIP w parametrach." if params.dig(:healthcare_provider_nip).nil?
      end
    end
  end
end