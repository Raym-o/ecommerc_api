# frozen_string_literal: true

class Page < ApplicationRecord
  validates :title, presence: true

  validates :title, length: { maximum: 50 }

  validates :content, length: { maximum: 2500 }
end
