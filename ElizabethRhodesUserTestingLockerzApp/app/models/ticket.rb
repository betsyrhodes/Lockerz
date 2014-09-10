class Ticket < ActiveRecord::Base
  belongs_to :locker
  before_validation :create_tix_number, on: :create
  validates :number, uniqueness: true

  def create_tix_number
    self.number = rand(000000 - 999999)
  end
end
