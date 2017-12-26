#!/usr/bin/env ruby

require 'net/http'

http = Net::HTTP.new('gitlab.com', 443)
http.use_ssl = true

token_headers = { 'PRIVATE-TOKEN' => ENV['GITLAB_TOKEN'] }

request = Net::HTTP::Put.new("api/v4/projects/#{ENV['GITLAB_USERNAME']}%2F#{ENV['GITLAB_PROJECT']}/pages/domains/#{ENV['LE_DOMAIN']}", token_headers)

content_headers = {
  'certificate' => IO.read("./certbot/config/live/#{ENV['LE_DOMAIN']}/fullchain.pem"),
  'key' => IO.read("./certbot/config/live/#{ENV['LE_DOMAIN']}/privkey.pem")
}

request.set_form_data(content_headers)
update_cert_response = http.request(request)

puts update_cert_response.code
puts update_cert_response.message

update_data = JSON.parse(update_cert_response.body)
