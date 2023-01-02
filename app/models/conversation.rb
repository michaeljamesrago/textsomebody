class Conversation < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  has_many :messages
end
