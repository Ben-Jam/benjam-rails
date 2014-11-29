class Item < ActiveRecord::Base
  has_many :children, class_name: "Item",
                          foreign_key: "parent_id"
 
  belongs_to :parent, class_name: "Item"
end
