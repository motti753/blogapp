web: bundle exec puma -C config/puma.rb
worker: bundle exec -C 2 sidekiq
release: bundle exec rake db:migrate