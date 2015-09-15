require 'addressable/uri'
require 'rest-client'
#
# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users'
# ).to_s
#
# puts RestClient.post(url, { user: {username: 'asdfda' } })
# puts RestClient.put(url + "/4", { user: {username: 'Alfred' } })
# puts RestClient.delete(url + "/4")

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts'
).to_s

# puts RestClient.post(url, { contact: {name: 'asdfda', email: 'asdfadsfad', user_id: 2 } })
# puts RestClient.put(url + "/4", { contact: {name: 'dsokdsfdsf'} })
puts RestClient.delete(url + "/4")
