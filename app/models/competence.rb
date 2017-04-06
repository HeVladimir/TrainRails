class Competence < ApplicationRecord

  belongs_to :user
  validates :name, uniqueness: true, format:  { with: /\D+\z/, message: "Только буквы и пробелы." }
  validates :lvl, numericality: { only_integer: true, greater_than: 0, less_than: 4}

end
