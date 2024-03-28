class InsertRedisMessagesIntoDatabaseJob < ApplicationJob
  queue_as :redis

  def perform(chat_id)
    $redis.smembers(chat_id).each do |message|
      message = JSON.parse(message)
      next if message["id"].present?
      created_message = Message.new(chat_id: chat_id, body: message["body"], number: message["number"])
      if created_message.save
        $redis.srem(chat_id, message.to_json)
        $redis.sadd(chat_id, created_message.to_json)
      end
    end
    messages_count = $redis.scard(chat_id.to_s)
    Chat.update(chat_id, messages_count: messages_count)
  end
end
