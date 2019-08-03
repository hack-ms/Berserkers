class BaseService < BusinessProcess::Base

  def treat_exception
    begin
      yield
    rescue Exception => e
      Rails.logger.error("From #{self.class.to_s}: #{e.message}")
      Rails.logger.error e.backtrace.first(16).join("\n\t")
      fail([I18n.t("services.base_service.errors.default")])
    end
  end

  def self.call(field = nil)
    super(field)
  end

end
