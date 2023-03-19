class ContactsController < ApplicationController
def index 
  @contacts = Contact.all
  render template: "contacts/index" 
end
