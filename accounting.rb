class Accounting
  attr_reader :amount, :sales_money

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @amount = 0
    @sales_money = 0
  end

  # お金投入。無効なお金の時は、そのままお金を返却
  def slot_money
    puts "\n何円投入しますか？ ※ 10,50,100,500,1000のいずれか"
    print " <= "
    money = gets.to_i
    return puts "有効なお金を入れてください" unless MONEY.include?(money)
    @amount += money
    puts "\n現在の投入金額は#{@amount}円です。"
  end

  # お釣り返却
  def return_money
    puts "#{@amount}円お返しします。"
    @amount = 0
  end

  # 投入金額追加
  def add_amount(money)
    @amount += money
  end

  # 売上金額追加
  def add_sales_money(money)
    @sales_money += money
  end
end
