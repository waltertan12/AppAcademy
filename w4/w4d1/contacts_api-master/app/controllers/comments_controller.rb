class CommentsController < ApplicationController
  def index
    @commentable = find_commentable
    render json: @commentable.comments
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
