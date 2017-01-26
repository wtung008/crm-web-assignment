# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.

require_relative 'contact'
require 'sinatra'

## Temporary fake data so that we always find contact with id 1.
Contact.create('Betty', 'Maker', 'betty@bitmakerlabs.com', 'Developer')


#Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
#Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
#Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')




get '/' do
  @crm_app_name = "Bitmaker's CRM"
  erb :index
end


get '/contacts' do
  erb :contacts
end


get '/contacts/new' do
  erb :new_contact
end


post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

# Viewing a contact's detail page
get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound   #404 Page not found message
  end
end

# Editing a contact
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end
