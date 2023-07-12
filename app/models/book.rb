class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :readers

  validates :title, presence: true
  validates :description, presence: true
end

