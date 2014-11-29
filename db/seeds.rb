# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# Top level items: ID, name, position
#
item_list = [
  [ 1, "Food", 2 ],
  [ 2, "TV", 3 ],
  [ 3, "pool", 4 ],
  [ 4, "Computer", 1 ]
]

item_list.each do |id, name, position|
  Item.create( id: id, name: name, position: position )
end


# Second level items: ID, name, parent, position
#
children_item_list = [
  [ 5, "biscuit", 1, 1 ],
  [ 6, "bread", 1, 2 ],
  [ 7, "breadsticks", 1, 3 ],
  [ 8, "dinner", 1, 4 ],
  [ 9, "lollies", 1, 5 ],
  [ 10, "pink biscuit", 1, 6 ],
  [ 11, "rice cakes", 1, 7 ],
  [ 12, "nutella toast", 1, 8 ],


  [ 13, "Barney", 2, 1 ],
  [ 14, "Brainy Baby", 2, 2 ],
  [ 15, "Elmo", 2, 3 ],
  [ 16, "Giggle Bellies", 2, 4 ],
  [ 17, "Hi-5", 2, 5 ],
  [ 18, "music", 2, 6 ],
  [ 19, "Wiggles", 2, 7 ],

  [ 20, "Elmo and I know it", 4, 1 ],
  [ 21, "Gangnam Style", 4, 2 ],
  [ 22, "Giggle Bellies", 4, 3 ],
  [ 23, "Hi-5", 4, 4 ],
  [ 24, "One Direction", 4, 5 ]
]

children_item_list.each do |id, name, parent, position|
  Item.create( id: id, name: name, parent_id: parent, position: position )
end