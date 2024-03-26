class Application < ApplicationRecord

has_many :chats
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end