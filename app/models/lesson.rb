class Lesson < ApplicationRecord
  belongs_to :student
  validates :time, uniqueness: true



  def time_overlap
    @lessons = Lesson.all

    @lessons.where(date: Time.zone.today).each do |les|
      les.time
    end

    return
  end


end
