class TestWorker < ApplicationController
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 5

  def perform(title)
    p 'work: title=' + title
  end

end