class Event < ApplicationRecord


  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
end
