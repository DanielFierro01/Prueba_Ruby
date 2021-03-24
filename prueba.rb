require "uri"
require "net/http"
require "json"
def request (adress, R81S5qlaZAWZAFj7zZtSUgq4bw0dGK125dz4b5rk)


url= URI ("#{adress}&api_key=#{api_key}") 
https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
response.read_body
JSON.parse response.read_body 
end

