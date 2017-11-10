class Paper < ActiveRecord::Base
  has_and_belongs_to_many :authors
  scope :year, ->(year) { where('year = ?', year) }

  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
end
