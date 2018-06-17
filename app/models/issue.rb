# == Schema Information
#
# Table name: issues
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  owner_id    :integer          not null
#  assignee_id :integer
#  status      :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Issue < ApplicationRecord
  enum status: [:pending, :in_progress, :resolved]

end
