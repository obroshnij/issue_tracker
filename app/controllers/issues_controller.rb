class IssuesController < ApplicationController
  def index
    render json: Issue.where(owner_id: current_user.id).or(Issue.where(assignee_id: current_user.id)).all
  end

  def show
  end

  def create
    form = ::IssueForm.new
    if form.submit(params) { |model| model.owner_id = current_user.id }
      render json: form.model
    else
      render json: form.error, status: 422
    end
  end

  def update
    form = ::IssueForm.new(params[:id])
    if form.submit(params)
      render json: form.model
    else
      render json: form.error, status: 422
    end
  end

  def destroy
    issue = Issue.find(params[:id])
    issue.destroy
  end
end
