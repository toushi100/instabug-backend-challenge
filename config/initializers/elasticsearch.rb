config = {
  host: "localhost",
  port: 9200,
  scheme: "https",
  retry_on_failure: true,
  transport_options: {
    request: { timeout: 10 },
  },
}
Elasticsearch::Model.client = Elasticsearch::Client.new(config)
