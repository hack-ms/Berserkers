class NotifyInterestedsWorker
  include Sidekiq::Worker
  sidekiq_options retry: 2

  def perform(work_id)
    @work = Work.find_by(id: work_id)

    if @work.present?
      @work.interested_users.find_each do |user|
        ApplicationMailer.new_update_work(@work.id, user.id).deliver_later
      end
    end
  end

end
