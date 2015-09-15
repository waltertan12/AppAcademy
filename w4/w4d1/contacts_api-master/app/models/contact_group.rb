# == Schema Information
#
# Table name: contact_groups
#
#  id         :integer          not null, primary key
#  group_id   :integer          not null
#  contact_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContactGroup < ActiveRecord::Base
  validates :contact_id, :group_id, presence: true

  belongs_to :group
  belongs_to :contact
end
