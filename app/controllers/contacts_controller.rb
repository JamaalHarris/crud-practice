class ContactsController < ApplicationController
def index 
  @contacts = Contact.all
  render template: "contacts/index" 
end


def create
  contact = Contact.new(
    name: params[:name],
    email: params[:email],
    phone_number: params[:phone_number]
  )
end

def show
  @contacts = Contact.find_by(id: name)
  render template: "contacts/show"
end