# frozen_string_literal: true
require 'net/http'
require 'pry'
require 'json'

module Rpwdl2
    module Http
        class ApiError < StandardError; end
        class NotAuthorized < StandardError; end

        class Client
            attr_reader :api_key, :base_url

            def initialize(api_key: nil, base_url: nil)
                @api_key = api_key
                @base_url = base_url
            end

            def get_ordering_provider(params)
                bodyHash = nil
                if params["nip"]
                    bodyHash = {"unikalnyIdentyfikatorKsiegi" => {"typIdentyfikatora" => "healthcare_provider_nip", "wartoscIdentyfikatora" => params["nip"]}}
                elsif params["ks_rej"]
                    bodyHash = {"unikalnyIdentyfikatorKsiegi" => {"typIdentyfikatora" => ledger_number, "wartoscIdentyfikatora" => params["ks_rej"]}}
                else
                    raise 'Brak numeru księgi resortowej lub numeru NIP w parametrach.'
                end
                Rpwdl2::Validator.validate_ordering_provider(bodyHash)
                make_post_request("/podmioty/ksiegi-rejestrowe/szukaj-jeden", bodyHash)
            end

            private
                def make_post_request(url, body)
                    uri = URI("#{base_url}#{url}")

                    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
                        request = Net::HTTP::Post.new(uri)
                        request['Content-Type'] = 'application/json'
                        request.body = body.to_json
                        http.request(request)
                    end
                    
                    response_body = JSON.parse(response.body)
        
                    case response.code&.to_i
                    when 200
                        return response_body
                    when 400
                        raise ApiError, "Problem z parametrami - #{response_body["wiadomosc"]["opis"]}"
                    when 401
                        raise NotAuthorized, "Wystąpił problem z autoryzacją - #{response_body["wiadomosc"]["opis"]}"
                    when 500
                        raise ApiError, "Problem po stronie serwera - #{response_body["wiadomosc"]["opis"]}"
                    else
                        raise StandardError, "Nieznany status #{response.code} - #{response_body}"
                    end
                end
        end
    end
end