class AddAuditToItems < ActiveRecord::Migration
  def change
    add_column :items, :audio, :binary, :limit => 16000000
  end
end
