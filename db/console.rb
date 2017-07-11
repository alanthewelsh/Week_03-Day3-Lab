require 'pry-byebug'
require_relative '../models/bounty'

Bounty.delete_all

space_cowboy1 = Bounty.new({
  'name' => 'Han Solo',
  'species' => 'Human',
  'bounty_value' => 1000,
  'last_known_location' => 'Leith'
})

space_cowboy2 = Bounty.new({
  'name' => 'Chewbacca',
  'species' => 'Wookie',
  'bounty_value' => 500,
  'last_known_location' => 'Restalrig'
})

space_cowboy1.save
space_cowboy2.save
bounties = Bounty.all
bounties.each { |i| puts i.name, i.species, i.bounty_value, i. last_known_location}

space_cowboy1.update
bounties = Bounty.all
bounties.each { |i| puts i.name, i.species, i.bounty_value, i. last_known_location}


space_cowboy2.delete
bounties = Bounty.all
bounties.each { |i| puts i.name, i.species, i.bounty_value, i. last_known_location}

space_cowboy2.save
bounty = Bounty.find
puts bounty['name'], bounty['species'], bounty['bounty_value'], bounty['last_known_location']

puts '---'
Bounty.delete_all
bounties = Bounty.all
bounties.each { |i| puts i.name, i.species, i.bounty_value, i. last_known_location}



