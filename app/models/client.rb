class Client < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :nullify # custom TBD for archive

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }

  def name
    first_name.capitalize + " " + last_name.upcase
  end

end
