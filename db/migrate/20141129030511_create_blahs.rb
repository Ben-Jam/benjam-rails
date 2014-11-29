class CreateBlahs < ActiveRecord::Migration
  def change
    create_table :blahs do |t|

      t.timestamps
    end
  end
end
