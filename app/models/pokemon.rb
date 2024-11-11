class Pokemon < ApplicationRecord
  has_and_belongs_to_many :types
  has_and_belongs_to_many :moves

  # validations
  validates :name, presence: true, uniqueness: true
  validates :hp, :attack, :defense, presence: true
end
