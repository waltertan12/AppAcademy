# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  todo_id     :integer          not null
#  stepbody    :text             not null
#  step_number :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Step < ActiveRecord::Base
  validates :todo_id, :stepbody, :step_number, presence: true
end
