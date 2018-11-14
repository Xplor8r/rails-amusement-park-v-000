class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if happiness && nausea
      if (happiness - nausea) < 0
        "sad"
      else
        "happy"
      end
    end
  end

  def num_of_rides
    attractions.count
  end
end
