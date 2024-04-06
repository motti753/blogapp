Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379') }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379') }
end

# Sidekiq.configure_server do |config|
#   config.redis = { url: 'redis://localhost:6379', namespace: 'test_sidekiq' }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://localhost:6379', namespace: 'test_sidekiq' }
# end