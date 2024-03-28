class DestroyMessageJob < ApplicationJob
  queue_as :redis

  def perform(message_id)
    message = Message.find(message_id)
    return if message.nil?
    $redis.srem(message.chat_id, message.to_json)
    message.destroy
  end
end
