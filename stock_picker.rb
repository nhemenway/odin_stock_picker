days = []
rand(50).times { days.push(rand(100)) } 


def stock_picker days
  last_day = days.length - 1
  earnings = 0
  buy_day = 0
  sell_day = 0

  days.each_with_index do |today_value, today|
    tomorrow = today + 1
    future = days[tomorrow, last_day]
    
    future.each_with_index do |future_value, future_day|
      if (future_value - today_value) > earnings
        earnings = future_value - today_value
        buy_day = today
        sell_day = tomorrow + future_day
      end
    end

  end

  puts "You should have bought on day #{buy_day} for $#{days[buy_day]} and sold on day #{sell_day} for $#{days[sell_day]} to make $#{earnings}!"
  puts "details below:"
  p days
end

stock_picker(days)
