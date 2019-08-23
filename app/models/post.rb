class Post < ApplicationRecord
  has_one_attached :image
  validate :editions_amount

  def editions_amount
    errors[:base] << "Превышено количество редакций!" if edition > 5
  end
end
