class HardJob
  include Sidekiq::Job

  # jobの追加方法 controllerからの呼び出し
  # HardJob.perform_async('default', 5)
  # HardJob.perform_async('mailer', 5)
  def perform(*args)
    # Do something
  end
end
