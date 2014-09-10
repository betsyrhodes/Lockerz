require 'spec_helper'

describe Locker do
  locker = Locker.create(size: "small", number: 100)

  it "is not full when created" do
    locker.full.should be_false
  end
  it "has size when created" do
    locker.size.should eq("small")
  end
  it "has locker number when created" do
    locker.number.should eq(100)
  end
end

describe Ticket do
  ticket = Ticket.create(locker_id: 1)

  it "has ticket number when created" do
    ticket.number.should be
  end

end