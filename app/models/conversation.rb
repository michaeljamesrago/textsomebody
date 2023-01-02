class Conversation < ApplicationRecord
  validates :number, presence: true, uniqueness: true
end
