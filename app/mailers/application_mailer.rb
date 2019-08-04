class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_update_work(work_id)
    @work = Work.find_by(id: work_id)

    if @work.present?
      mail(
        to: "",
        from: "",
        subject: ""
      )
    end
  end

end
