module ApplicationHelper

  def toastr_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def define_back_url
    if request.path.include?("complaints/new")
      work_path(params[:work_id])
    elsif request.path.include?("/promo_codes/")
      user_promo_codes_path(:me)
    else
      root_path
    end
  end

end
