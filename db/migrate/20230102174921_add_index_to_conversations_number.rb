class AddIndexToConversationsNumber < ActiveRecord::Migration[7.0]
  def change
    add_index :conversations, :number, unique: true
  end
end
