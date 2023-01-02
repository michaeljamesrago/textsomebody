class Message < ApplicationRecord
  belongs_to :conversation
  validates :body, presence: true, length: { maximum: 160 }
  after_create_commit { broadcast_append_to self.conversation }
end
