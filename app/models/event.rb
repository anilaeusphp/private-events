class Event < ApplicationRecord


  has_many :enrollments, dependent: :destroy
  has_many :attendees, through: :enrollments, source: :user
  belongs_to :creator, foreign_key: "user_id", class_name: "User"

  def past
    self.where("created_at < ?", Date.now)
  end

  scope :past, -> {where("date < ? ", Date.now) }

  scope :upcoming ,-> {where("date >= ?", Date.now)}
end
