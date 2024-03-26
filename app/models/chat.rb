class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages
  before_create :set_number
  after_create :update_application_chats_count

  def set_number
    application = Application.find(self.application_id)
    self.number = application.chats.count + 1
  end
  def update_application_chats_count
    application = Application.find(self.application_id)
    application.update(chats_count: application.chats.count)
  end
end
