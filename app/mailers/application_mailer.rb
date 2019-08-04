class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_update_work(work_id, user_id)
    @work = Work.find_by(id: work_id)
    @user = USer.find_by(id: user_id)

    if @work.present? && @user.present?
      mail(
        to: @user.email,
        from: "acompanhai@example.com",
        subject: "Nova atualização em uma obra de seu interesse"
      )
    end
  end

  def send_promo_code(promo_code_id, user_id)
    @promo_code = PromoCode.find_by(id: promo_code_id)
    @user = USer.find_by(id: user_id)

    if @promo_code.present? && @user.present?
      mail(
        to: @user.email,
        from: "acompanhai@example.com",
        subject: "Código promocional para você"
      )
    end
  end

end
