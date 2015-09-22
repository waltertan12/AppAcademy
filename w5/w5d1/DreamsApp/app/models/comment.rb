class Comment < ActiveRecord::Base
  validates :body, :author_id, :commentable_id, :commentable_type, presence: true
  validates :spooky, inclusion: {in: [true, false]}

  belongs_to :commentable, polymorphic: true
end
