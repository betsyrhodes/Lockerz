require 'spec_helper'

describe "Visitor can search for available locker", :type => :feature, :js => true do

  ticket = Ticket.create(locker_id: 1)
  Locker.create(id: 1, size: "small", number: 100, full: false)
  Locker.create(id: 3, size: "medium", number: 300, full: false)

  it "can see locker number after selecting size" do
    visit '/'
    select "Small", :from => "size"
    click_button 'Find Empty Locker'

    expect(page).to have_content("100")
  end

  it "creates a ticket after selecting size" do
    visit '/'

    expect {
      select "Small", :from => "size"
      click_button 'Find Empty Locker'
    }.to change(Ticket, :count).by(1)
    expect(page).to have_content("Your Ticket Number")
  end

  it "can print ticket" do
    visit '/'
    select "Medium", :from => "size"
    click_button 'Find Empty Locker'

    expect(page).to have_content("Print Ticket")
  end

end


describe "Visitor can search for item", :type => :feature do

  ticket = Ticket.create(locker_id: 1)
  Locker.create(id: 1, size: "small", number: 100, full: true)

  it "can see locker number when a ticket number entered" do
    visit '/'
    fill_in 'number', :with => ticket.number
    click_button 'Find Locker'

    expect(page).to have_content '100'
  end

end