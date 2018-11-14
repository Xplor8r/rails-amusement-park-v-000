class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, :through => :rides
  has_secure_password

  def mood
<<<<<<< HEAD
    if happiness && nausea
      mood = happiness - nausea
      mood > 0 ? "happy" : "sad"
=======
    if nausea <= happiness
      "happy"
    else
      "sad"
>>>>>>> e8377532b7eb71ab9d63994d832d74e2b92e9d61
    end
  end

  def total_rides
    attractions.count
  end
end
