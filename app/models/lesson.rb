class Lesson < ApplicationRecord
  belongs_to :student
  validates_uniqueness_of :time, :scope => :date
end
