
# config/initializers/dartsass.rb
Rails.application.config.dartsass.builds = {
  "." => "."
}

# config/initializers/dartsass.rb
Rails.application.config.dartsass.build_options << ' --load-path=node_modules'

# Rails.application.config.dartsass.load_paths = {
#   "app/assets/stylesheets"
# }