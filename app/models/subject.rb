class Subject < ApplicationRecord
  has_and_belongs_to_many :books
  validates :subject_name, presence: true
end