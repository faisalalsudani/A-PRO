class Student < ApplicationRecord
  has_many :lessons,  dependent: :destroy

  def lessen_betaald
    @lessen_betaald = lessons.where(paid: true).length * 30
    return @lessen_betaald
  end

  def lessen_niet_betaald
    @lessen_niet_betaald = lessons.where(paid: nil).length
    return @lessen_niet_betaald
  end

end
