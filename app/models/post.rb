class Post < ApplicationRecord
  validate :editions_amount

  def editions_amount
    errors[:base] << "Превышено количество редакций!" if edition > 5
  end
end
