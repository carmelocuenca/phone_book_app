class Employee < ActiveRecord::Base
  belongs_to :company, touch: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company, presence: true

  # scope :workers_in, -->(state) {includes(:company).where("companies.state = ?", state).references(:company)

  def to_s
    "#{first_name} #{last_name}"
  end

end
