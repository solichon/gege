class DropInstallsSubscribers < ActiveRecord::Migration[5.1]
  def change
    drop_table :subscribers
  end
end
