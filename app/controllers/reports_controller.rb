class ReportsController < ApplicationController

  before_action :find_report, only: %i[show update delete]

  def show
    render json: @report
  end

  def index
    @reports = Report.all
    render json: @reports
  end

  def new_comment
    report = Report.find_by(id: params[:reportId])
    report.comments.create(content: params[:content], report_id: params[:reportId], user_id: params[:userId], points: 0)

    render json: report
  end

  def create
    # Cloudinary::Uploader.upload("image file", :public_id => 'uniq_id')
    # /w_130,h_100,c_fill/
    byebug
    state_id = State.find_by(abbreviation: params[:state]).id
    report = Report.new(description: params[:description], title: params[:title], date: params[:date], state_id: state_id, votes: 0, user_id: params[:id])
    if report.save
      id = report.id
      Cloudinary::Uploader.upload(params[:image].tempfile, public_id: report.id)
      report.update(image: "https://res.cloudinary.com/dont-mess/image/upload/w_500/#{id}.jpg")
      Address.create(city: params[:city], street: params[:street], zipcode: params[:zipcode], report_id: id)
      ReportGeolocation.create(latitude: params[:latitude], longitude: params[:longitude], report_id: id)

      render json: ReportSerializer.new(report)
    else
      render json: {error: 'get outahere'}
    end
  end

  def points
    # byebug
    comment = Comment.find_by id: params[:commentId]
    direction = params[:where]
    if direction == 'up'
      comment.update(points: comment.points + 1)
      render json: comment
    elsif direction == 'down'
      comment.update(points: comment.points - 1)
      render json: comment
    else
      render json: { error: 'cant upvote or downvote comment' }
    end
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
