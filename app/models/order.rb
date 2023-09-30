class Order < ApplicationRecord
  
  has_many :line_items # establishes an association between the "Order" model and the "LineItem" model. an order can have many line items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

end
