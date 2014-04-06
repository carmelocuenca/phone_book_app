class CompaniesSweeper < ActionController::Caching::Sweeper
  observe Company
  def after_create(company)
    #expire_fragment(%r{table_of_all_companies/.*})
    expire_fragment('table_of_all_companies')
  end
end