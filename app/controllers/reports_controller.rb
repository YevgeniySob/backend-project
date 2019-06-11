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

  def report_by_state
    # byebug
    @reports = State.find_by(abbreviation: params[:state]).reports
    render json: @reports
  end

  def vote
    vote = params[:vote]
    report = Report.find_by(id: params[:reportId])
    if vote == 'up'
      report.update(votes: report.votes += 1)
    elsif vote == 'down'
      report.update(votes: report.votes -= 1)
    end
  end

  private

  def find_report
    @report = Report.find_by(id: params[:id])
  end
end
