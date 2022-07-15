class Accounting
  attr_reader :slot_money, :sales_money

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @sales_money = 0
  end

  # 現在の投入金額確認
  def current_slot_money
    @slot_money
  end

  # 現在の売上金額確認
  def current_sales_money
    @sales_money
  end

  # お金投入。無効なお金の時は、そのままお金を返却
  def slot_moneys(money)
    return puts "有効なお金を入れてください" unless MONEY.include?(money)
    @slot_money += money
    puts "\n現在の投入金額は#{@slot_money}円です。"
  end

  # お釣り返却。売上金額も0にリセット。トータル売上金額はそのまま
  def return_money
    puts "#{@slot_money}円お返しします。"
    @slot_money = 0
    # @sales_money = 0
  end

  # 投入金額追加
  def add_slot_money(money)
    @slot_money += money
  end

  # 売上金額追加
  def add_sales_money(money)
    @sales_money += money
  end
end
