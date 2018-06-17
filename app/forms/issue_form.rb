class IssueForm < ApplicationForm
  attribute :title,             String
  attribute :description,       String
  attribute :assignee_id,       Integer
  attribute :status,            String

  # optionally accept issue_id in order to check if we're working with persisted
  # object or shall we create new one
  def initialize(issue_id=nil)
    @issue =
      if issue_id
        Issue.find(issue_id)
      else
        Issue.new
      end
  end

  def model
    @issue
  end

  # method for persiting data when validations are already passed
  def persist
    model.update persistance_data
  end

  # slice params from the controller
  def persistance_data
    attributes.slice(
      :title,
      :description,
      :assignee_id,
      :status
    )
  end
end
