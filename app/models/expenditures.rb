###
# Class to model EXPENDITURES_FUNDS oracle table
###
class Expenditures < ActiveRecord::Base
  self.table_name = 'expenditures'

  def self.ta_fund_code
    order(ta_fund_code: :asc)
  end
end
