require_relative 'lib/rpwdl2'

Rpwdl2.configure do |config|
  config.base_url = 'https://api.ezdrowie.gov.pl/rpwdl'
end

client = Rpwdl2.client

params = {"nip" => "1234567890", "ks_rej" => "1234567890"}
response = client.get_ordering_provider(params)

puts response
puts 'Working'
