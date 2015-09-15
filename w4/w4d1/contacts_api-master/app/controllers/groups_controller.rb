class GroupsController < ApplicationController
  def index
    render json: User.find(params[:user_id]).groups
  end

  def show
     render json: Group.find(params[:id]).contacts
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group
    else
      render(
        json: @group.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    destroyed = Group.find(params[:id]).destroy!
    render json: destroyed
  end

  def update
    @group = Group.find(params[:id]).update(group_params)
    if @group.save
      render json: @group
    else
      render(
        json: @group.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private
  def group_params
    params[:group].permit(:name, :user_id)
  end
end
