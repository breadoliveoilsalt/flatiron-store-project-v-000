class Item < ActiveRecord::Base

  has_many :line_items
  belongs_to :category

  def self.available_items
    arr = []
    self.all.each do |item|
      if item.inventory > 0
        arr << item
      end
    end
    arr
  end



end
