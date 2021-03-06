class LineItem < ActiveRecord::Base
  belongs_to :invoice, touch: true

  before_save :calculate_amount
  after_save { invoice.touch }

  def calculate_amount
    self.amount = quantity * unit_price
  end
end
