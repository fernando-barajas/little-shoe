module ApplicationHelper
  def stock_item_row_background(count_on_hand)
    count_on_hand.zero? ? 'bg-red-50' : 'bg-white'
  end

  def show_close_icon
    File.open('app/assets/images/cross_mark.svg', 'rb') do |file|
      raw file.read
    end
  end
end
