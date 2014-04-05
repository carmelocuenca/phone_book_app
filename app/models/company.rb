class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :employees, dependent: :destroy

  after_create   :expire_cache
  # after_update   :expire_cache
  # before_destroy :expire_cache

  #after_touch    :expire_cache

  def to_s
    name
  end

  private
  def expire_cache
    ActionController::Base.new.expire_fragment(%r{table_of_all_companies/.*})
  end
end
