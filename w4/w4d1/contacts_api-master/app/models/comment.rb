class Comment < ActiveRecord::Base
  validates :body, :commentable_id, :author_id, :commentable_type, presence: true

  belongs_to :user, class_name: "User", foreign_key: :author_id
  belongs_to :commentable, polymorphic: true
end
