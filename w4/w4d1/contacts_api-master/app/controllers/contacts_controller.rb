class ContactsController < ApplicationController
  def index
    @contacts = User.find(params[:user_id]).shared_contacts
    render json: @contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json:  @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    destroyed = @contact.destroy!
    render json: destroyed
  end

  def show
    render json: Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def favorites
    @contacts = User.find(params[:id]).shared_contacts
    render json: @contacts.select { |contact| contact.favorite? }
  end

  private
  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end
end
