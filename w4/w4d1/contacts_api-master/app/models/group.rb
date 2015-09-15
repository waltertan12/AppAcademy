# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
  validates :user_id, :name, presence: true
  belongs_to :user
  has_many :contact_groups
  has_many :contacts, through: :contact_groups, source: :contact
  has_many :comments, as: :commentable
end
