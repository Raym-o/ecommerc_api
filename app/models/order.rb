# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  validates :status, :pst, :gst, :hst, :customer, presence: true

  # def paid?
  #   status == 'Paid'
  # end

  # def sub_total
  #   order_items.map(&:price).reduce(:+)
  # end

  # def taxes
  #   { PST: pst, GST: gst, HST: hst }.reject { |_, v| v.zero? }
  # end

  # def tax_amounts
  #   taxes.map { |_, v| (sub_total * v).round(2) }
  # end

  # def grand_total
  #   sub_total + tax_amounts.reduce(:+)
  # end

  # def create_order_product(product)
  #   order_products.create!(
  #     price: product.price,
  #     order: self,
  #     product: product
  #   )
  # end
end
