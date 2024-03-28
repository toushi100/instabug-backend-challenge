class CreateChatJob < ApplicationJob
  queue_as :redis

  def perform(application_id)
    application = Application.find(application_id)
    return if application.nil?
    chat = Chat.create(application: application)
  end
end
