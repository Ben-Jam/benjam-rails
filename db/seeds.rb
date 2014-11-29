# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

item_list = [
  [ 1,"food", 1 ],
  [ 2,"tv", 2 ],
  [ 3,"pool", 3 ]
]

item_list.each do |id,name, position|
  Item.create( id: id, name: name, position: position )
end

children_item_list = [
  [ 4,"biscuits", 1,1 ],
  [ 5,"nutela toast",1, 2 ],
  [ 6,"spagbol", 1,3 ],
  [ 7,"hi-5", 2,3 ]
]

children_item_list.each do |id,name,parent, position|
  Item.create( id: id, name: name,parent_id: parent, position: position )
end