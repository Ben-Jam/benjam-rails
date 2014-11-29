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
  [ 4, "biscuit", 1, 1 ],
  [ 5, "bread", 1, 2 ],
  [ 6, "breadsticks", 1, 3 ],

  [ 7, "dinner", 1, 4 ],
  [ 8, "lollies", 1, 5 ],
  [ 9, "pink biscuit", 1, 6 ],

  [ 10, "rice cakes", 1, 7 ],
  [ 11, "nutella toast", 1, 8 ],


  [ 12, "Barney", 2, 1 ],
  [ 13, "Brainy Baby", 2, 2 ],
  [ 14, "Elmo", 2, 3 ],

  [ 15, "Giggle Bellies", 2, 4 ],
  [ 16, "Hi-5", 2, 5 ],
  [ 17, "music", 2, 6 ],

  [ 18, "Wiggles", 2, 7 ],


  [ 19, "Elmo and I know it", 4, 1 ],
  [ 20, "Gangnam Style", 4, 2 ],
  [ 21, "Giggle Bellies", 4, 3 ],
  
  [ 22, "Hi-5", 4, 4 ],
  [ 23, "One Direction", 4, 5 ]
]

children_item_list.each do |id, name, parent, position|
  Item.create( id: id, name: name, parent_id: parent, position: position )
end