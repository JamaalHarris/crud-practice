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