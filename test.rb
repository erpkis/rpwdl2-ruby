require_relative 'lib/rpwdl2'
require 'logger'

# Setup logging
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

puts "=== Manual Test Script ==="

# Test 1: Konfiguracja
puts "\n1. Testing configuration..."
Rpwdl2.configure do |config|
  config.base_url = 'https://api.ezdrowie.gov.pl/rpwdl'
end

puts "✓ Base URL: #{Rpwdl2.base_url}"

# Test 2: Client creation
puts "\n2. Testing client creation..."
client = Rpwdl2.client
puts "✓ Client created: #{client.class}"
binding.pry
# Test 3: Walidacja
# puts "\n3. Testing validation..."
# begin
#   Rpwdl2::Validators.validate_jednostka_params(nip: '1234567890')
#   puts "✓ Valid NIP validation passed"
# rescue => e
#   puts "✗ Validation error: #{e.message}"
# end

# begin
#   Rpwdl2::Validators.validate_jednostka_params(nip: '123')
#   puts "✗ Invalid NIP should have failed"
# rescue => e
#   puts "✓ Invalid NIP correctly rejected: #{e.message}"
# end

# Test 4: Mock API call (żeby nie spamować prawdziwego API)
# puts "\n4. Testing API calls with WebMock..."
# require 'webmock'
# include WebMock::API
# WebMock.enable!

# # Mock successful response
# stub_request(:get, /Rpwdl2\.ezdrowie\.gov\.pl/)
#   .to_return(
#     status: 200,
#     body: {
#       data: [
#         { id: 1, nip: '1234567890', nazwa: 'Test Unit' }
#       ],
#       meta: { count: 1 }
#     }.to_json,
#     headers: { 'Content-Type' => 'application/json' }
#   )

# begin
#   result = client.search_jednostki_kierujace(nip: '1234567890')
#   puts "✓ API call successful"
#   puts "  - Success: #{result[:success]}"
#   puts "  - Data count: #{result[:data].size}"
#   puts "  - First item: #{result[:data].first[:nazwa]}"
# rescue => e
#   puts "✗ API call failed: #{e.message}"
# end

# # Test 5: Error handling
# puts "\n5. Testing error handling..."
# stub_request(:get, /Rpwdl2\.ezdrowie\.gov\.pl.*error/)
#   .to_return(status: 500, body: 'Internal Server Error')

# begin
#   result = client.search_jednostki_kierujace(nip: '0000000000')
#   puts "✗ Should have thrown error"
# rescue Rpwdl2::ApiError => e
#   puts "✓ Correctly caught API error: #{e.message}"
# rescue => e
#   puts "✗ Unexpected error: #{e.class} - #{e.message}"
# end

# puts "\n=== Manual Test Complete ==="
