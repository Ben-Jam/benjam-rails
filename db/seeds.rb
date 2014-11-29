# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

item_list = [
  [ 1,"apple", 1 ],
  [ 2,"banana", 2 ],
  [ 3,"pool", 3 ],
  [ 4,"water", 4 ],
  [ 5,"computer", 5 ],
  [ 6,"toast",6 ],
  [ 7,"tv", 7 ],
  [ 8,"hi5", 8 ], 
  [ 9,"hi5", 9 ] 
]

item_list.each do |id,name, position|
  Item.create( id: id, name: name, position: position )
end
