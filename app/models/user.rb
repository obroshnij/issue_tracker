# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :integer          default("regular_user"), not null
#

class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :password, presence: true
  enum role: [:user, :manager]
end
