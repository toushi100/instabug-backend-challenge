class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :chat

  settings index: { :number_of_shards => 1 } do
    mappings dynamic: false do
      indexes :chat_id, type: :text
      indexes :body, type: :text, analyzer: :english
    end
  end

  def self.search(term, chat_id)
    response = __elasticsearch__.search(
      query: {
        bool: {
          must: [
            { match: { chat_id: chat_id } },
            { query_string: { query: "*#{term}*", fields: [:body] } },
          ],
        },
      },
    )
    response.results.map { |r| { body: r._source.body, number: r._source.number } }
  end
end
