class AddUserToClients < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :user, foreign_key: true
  end
end
