require "sidekiq"
require "sidekiq/web"
require "sidekiq/cron/web"

schedule_file = "config/schedule.yml"

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
# Sidekiq.options[:poll_interval] = 10

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_URL"] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDIS_URL"] }
end

# Sidekiq.default_worker_options["retry"] = 0

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV["SIDEKIQ_WEB_USERNAME"], ENV["SIDEKIQ_WEB_PASSWORD"]]
end
