#!/usr/bin/env ruby

require 'net/http'
require 'json'

CERTBOT_DOMAIN = ENV['CERTBOT_DOMAIN']

puts "Domain is #{CERTBOT_DOMAIN}"

http = Net::HTTP.new('www.hover.com', 443)
http.use_ssl = true

login_headers = {
  'username' => ENV['HOVER_USERNAME'],
  'password' => ENV['HOVER_PASSWORD']
}

puts 'Logging in to hover'

uri = URI('https://www.hover.com/api/login')
login_response = Net::HTTP.post_form(uri, login_headers)

login_data = JSON.parse(login_response.body)

unless login_data['succeeded'] == true
  print 'Unable to login: #{login_response.message}'
  exit
end

cookies = login_response.response['set-cookie'].split('; ')[0]
cookie_headers = { 'Cookie' => cookies }

puts "Fetching the DNS ID from domain #{CERTBOT_DOMAIN}"

dns_response = http.get("/api/domains/#{ENV['CERTBOT_DOMAIN']}/dns", cookie_headers)

domains_data = JSON.parse(dns_response.body)

unless domains_data['succeeded'] == true
  puts "Error retrieving domains: #{update_dns_response.message}"
  exit
end

dns_id = domains_data['domains']
  .select { |domain| domain['domain_name'] == CERTBOT_DOMAIN }.first['entries']
  .select { |dns| dns['type'] == 'TXT' && dns['name'] == '_acme-challenge' }.first.dig('id')

puts "Deleting DNS record with ID: #{dns_id}"

request = Net::HTTP::Delete.new("/api/dns/#{dns_id}", cookie_headers)

delete_dns_response = http.request(request)

delete_data = JSON.parse(delete_dns_response.body)

unless delete_data['succeeded'] == true
  puts "Error deleting record: #{delete_dns_response.message}"
  exit
end
