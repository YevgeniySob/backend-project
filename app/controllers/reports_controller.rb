class ReportsController < ApplicationController

  before_action :find_report, only: %i[show update delete]

  def show
    render json: @report
  end

  def index
    @reports = Report.all
    render json: @reports
  end

  def create

  end

  def update

  end

  def delete

  end

  private

  def find_report
    @report = Report.find_by(id: params[:id])
  end
end
