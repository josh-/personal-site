#!/usr/bin/env ruby

require 'net/http'
require 'net/https'
require 'uri'
require 'json'

http = Net::HTTP.new('gitlab.com', 443)
http.use_ssl = true

token_headers = { 'PRIVATE-TOKEN' => ENV['GITLAB_TOKEN'] }

request = Net::HTTP::Put.new("https://gitlab.com/api/v4/projects/#{ENV['GITLAB_USERNAME']}%2F#{ENV['GITLAB_PROJECT']}/pages/domains/#{ENV['LE_DOMAIN']}", token_headers)

certificate_data = {
  'certificate' => IO.read("./certbot/config/live/#{ENV['LE_DOMAIN']}/fullchain.pem"),
  'key' => IO.read("./certbot/config/live/#{ENV['LE_DOMAIN']}/privkey.pem")
}

request.set_form_data(certificate_data)

# http.set_debug_output $stderr

puts request.body

update_cert_response = http.request(request)
