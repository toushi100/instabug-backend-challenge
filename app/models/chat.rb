class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages, dependent: :destroy
  before_create :set_number
  after_create :update_application_chats_count

  def set_number
    last_chat_numebr = self.application.chats.last.number || 0
    self.number = last_chat_numebr + 1
  end

  def update_application_chats_count
    application = Application.find(self.application_id)
    application.update(chats_count: application.chats.count)
  end
end
