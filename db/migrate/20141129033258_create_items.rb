class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :position
      t.binary    "image", :limit => 16000000

      t.timestamps
    end
  end
end
