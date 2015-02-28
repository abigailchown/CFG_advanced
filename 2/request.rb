require 'open-uri'

kittens = open("http://placekitten.com/")

body = kittens.read[559, 441]

puts body
puts body.status

