class RefreshMessageIndexJob < ApplicationJob
  queue_as :redis

  def perform
    unless Message.__elasticsearch__.index_exists?
      Message.__elasticsearch__.create_index!
    end
    Message.import
    puts "Message index refreshed!===================================================================================================="
  end
end
