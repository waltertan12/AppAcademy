class Dream < ActiveRecord::Base
  validates :title, :content, :user_id, :completeness, presence: true
  validates :spooky, inclusion: { in: [true, false]}
  validates :completeness, inclusion: { in: (0..100) }

  belongs_to :user
  include Commentable
end
