class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render template: "contacts/index"
  end

  def create
    @contact = Contact.create(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    if @contact.valid?
      # happy path
      render template: "contacts/show"
    else
      # sad path
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render template: "contacts/show"
  end

  def update
    contact = Contact.find_by(id: name)
    contact.update(
      name: params[:name] || contact.name,
      email: params[:email] || contact.email,
      phone_number: params[:phone_number] || contact.phone_number,
    )
    if contact.valid?
      # happy path
      render json: contact.as_json
    else
      # sad path
      render json: { errors: contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render json: { message: "Contact Removed" }
  end
end
