# class FetchUpdatesWorksWorker
#   include Sidekiq::Worker
#   sidekiq_options retry: 2
#
#   def perform
#     UpdateDatabase.call
#   end
#
#
# end
