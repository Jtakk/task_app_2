class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :number, presence: true
  
  
  # 予約した日数×人数を返す (indexで使用)
  def pre_price
    (self.end.to_date - self.start.to_date).to_i * self.number.to_i
  end
end
