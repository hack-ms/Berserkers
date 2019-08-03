class ComplaintsController < ApplicationController
  before_action :set_work, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @complaint = Complaint.new
  end

  def create
    complaint = current_user.complaints.create(complaint_params.merge(work_id: @work.id))

    if complaint.persisted?
      flash[:notice] = "Denúncia criada com sucesso"
    else
      flash[:error] = "Erro ao criar denúncia"
    end

    redirect_to work_path(@work)
  end

  private
    def set_work
      @work = Work.find_by(id: params[:work_id])
      return redirect_to works_path unless @work.present?        
    end

    def complaint_params
      params.require(:complaint).permit(:description, :photo)
    end
end
