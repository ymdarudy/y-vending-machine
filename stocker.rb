# require "./accounting"
# load "accounting.rb"

class Stocker
  attr_reader :name, :price, :stock

  # 今回はすべて在庫(stock)5個なので、デフォルト値を5に設定
  def initialize(name:, price:, stock: 5)
    @name = name
    @price = price
    @stock = stock
  end

  # 在庫補充メソッド
  def store(num)
    @stock += num
  end
end

# ドリンク情報
# @drinksをNavigtorからもらう前提
# def info
#   self.each_with_index do |drink, i|
#     puts "#{i + 1}: #{drink.name}, #{drink.price}円"
#   end
# end

# コーラ買えるかな？
# def can_buy_cola?
#   if @cola[:stock] == 0
#     @cannot_buy_reason_cola = "在庫が0です。"
#     false
#   elsif @slot_money < @cola[:price]
#     @cannot_buy_reason_cola = "投入金額が#{@cola[:price] - @slot_money}円足りません。"
#     false
#   else
#     true
#   end
# end

# コーラ買います
# def buy_cola
#   if can_buy_cola?
#     puts "#{@cola[:name]}をどうぞ！"
#     @cola[:stock] -= 1
#     @slot_money -= @cola[:price]
#     @sales_money += @cola[:price]
#     @total_sales_money += @cola[:price]
#     return_money
#   else
#     puts @cannot_buy_reason_cola
#   end
# end

# レッドブル買えるかな？
# def can_buy_red_bull?
#   if @red_bull[:stock] == 0
#     @cannot_buy_reason_red_bull = "在庫が0です。"
#     false
#   elsif @slot_money < @red_bull[:price]
#     @cannot_buy_reason_red_bull = "投入金額が#{@red_bull[:price] - @slot_money}円足りません。"
#     false
#   else
#     true
#   end
# end

# レッドブル買います
# def buy_red_bull
#   if can_buy_red_bull?
#     puts "#{@red_bull[:name]}をどうぞ！"
#     @red_bull[:stock] -= 1
#     @slot_money -= @red_bull[:price]
#     @sales_money += @red_bull[:price]
#     @total_sales_money += @red_bull[:price]
#     return_money
#   else
#     puts @cannot_buy_reason_red_bull
#   end
# end

# 水買えるかな？
# def can_buy_water?
#   if @water[:stock] == 0
#     @cannot_buy_reason_water = "在庫が0です。"
#     false
#   elsif @slot_money < @water[:price]
#     @cannot_buy_reason_water = "投入金額が#{@water[:price] - @slot_money}円足りません。"
#     false
#   else
#     true
#   end
# end

# 水買います
# def buy_water
#   if can_buy_water?
#     puts "#{@water[:name]}をどうぞ！"
#     @water[:stock] -= 1
#     @slot_money -= @water[:price]
#     @sales_money += @water[:price]
#     @total_sales_money += @water[:price]
#     return_money
#   else
#     puts @cannot_buy_reason_water
#   end
# end

# どのドリンクが買えるかな？
# def can_buy_drink?(money)
#   money = Accounting.new
#   puts "投入金額: #{money.slot_money}円"
#   @drinks.each do |drink|
#     if drink[:stock] == 0
#       cannot_buy_reason = "在庫が0です。"
#       puts "#{drink[:name]}は#{cannot_buy_reason}"
#       false
#     elsif money.slot_money < drink[:price]
#       cannot_buy_reason = "投入金額が#{drink[:price] - money.slot_money}円足りません。"
#       puts "#{drink[:name]}を買うには#{cannot_buy_reason}"
#       false
#     else
#       puts "#{drink[:name]}を購入できます！"
#       true
#     end
#   end
# end

# end
