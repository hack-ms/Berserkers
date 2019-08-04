class ComplaintsController < ApplicationController
  before_action :set_work, only: [:new, :create]
  before_action :set_complaint, only: [:edit, :update]
  before_action :authenticate_user!

  def new
    @complaint = Complaint.new
  end

  def create
    complaint = current_user.complaints.create(complaint_params.merge(work_id: @work.id))

    if complaint.persisted?
      current_user.increment_score!
      flash[:notice] = "Avaliação criada com sucesso"
    else
      flash[:error] = "Erro ao criar avaliação"
    end

    redirect_to work_path(@work)
  end

  def update
    if complaint.update(complaint_params)
      flash[:notice] = "Avaliação atualizada com sucesso"
    else
      flash[:error] = "Erro ao criar avaliação"
    end

    redirect_to work_path(@work)
  end

  def edit
  end

  private
    def set_work
      @work = Work.find_by(id: params[:work_id])
      return redirect_to works_path unless @work.present?
    end

    def set_complaint
      @complaint = Complaint.find_by(id: params[:id])
      return redirect_to works_path unless @complaint.present?
    end

    def complaint_params
      params.require(:complaint).permit(:description, :photo, :lat, :lng)
    end
end
