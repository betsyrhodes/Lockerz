get '/' do
  erb :index
end

get '/tickets' do
  message = ""
  ticket = Ticket.find_by_number(params["number"])
  if ticket
    locker = Locker.find(ticket.locker_id)
    ticket_number = ticket.number
    locker_number = locker.number

    ticket.delete
    locker.update_attributes(full: false)
  else
    message = "Ticket number not found. Please enter a new number."
  end

  {ticket_number: ticket_number, locker_number: locker_number, message: message}.to_json
end

post '/sizes' do
  message = ""
  size = params["size"]
  available_locker = find_available_locker(size)
  if available_locker
    available_locker.update_attributes(full: true)
    Ticket.create(locker_id: available_locker.id)

    ticket = Ticket.find_by_locker_id(available_locker.id).number
    locker_number = available_locker.number
  else
    message = "No lockers currently available."
  end

  {ticket: ticket, locker_number: locker_number, message: message}.to_json
end