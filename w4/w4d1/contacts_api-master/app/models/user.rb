# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_many :contacts, dependent: :destroy
  has_many :contact_shares, dependent: :destroy
  has_many(
    :shared_contacts,
    through: :contact_shares,
    source: :contact
  )
  has_many :groups
  has_many :comments, as: :commentable
  has_many :authored_comments, class_name: "Comment", foreign_key: :author_id
end
