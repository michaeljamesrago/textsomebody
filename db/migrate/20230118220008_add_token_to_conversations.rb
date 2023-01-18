class AddTokenToConversations < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :token, :string
  end
end
