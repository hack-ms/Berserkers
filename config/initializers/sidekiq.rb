schedule_file = "config/schedule.yml"

Sidekiq.configure_server do |config|
  config.redis = { namespace: "berserkers_sidekiq" }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: "berserkers_sidekiq" }
end

if File.exists?(schedule_file)
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
