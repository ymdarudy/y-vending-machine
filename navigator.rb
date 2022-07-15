require_relative "accounting.rb"
require_relative "stocker.rb"

# ↓完成したら不要なので消す
load "accounting.rb"
load "stocker.rb"

class Navigator
  def initialize
    @account = Accounting.new
    @drinks = []
    @drinks << @cola = Stocker.new(name: "コーラ", price: 120)
    @drinks << @red_bull = Stocker.new(name: "レッドブル", price: 200)
    @drinks << @water = Stocker.new(name: "水", price: 100)
  end

  # n番目のドリンクをnum個補充する
  # def store_drink(drink, num)
  #   drink.store(num)
  # end

  def can_buy?
    @drinks.can_buy_drink?(@account)
  end

  def slot_money(money)
    @account.slot_moneys(money)
  end

  def buy_drink(drink)
    drink.store(-1)
    @account.add_slot_money(-drink.price)
    @account.add_sales_money(drink.price)
  end

  def select_menu
    puts "1: 商品を確認する\n2: お金を入れる\n3: 立ち去る"
    print " <= "
    gets.to_i
  end

  def drink_info
    @drinks.each_with_index do |drink, i|
      puts "#{i + 1}: #{drink.name}, #{drink.price}円, 在庫:#{drink.stock}"
    end
  end

  # def drink_prices
  #   @drinks.map(&:price)
  # end

  def select_drink
    puts "\n購入したいドリンクの番号を選択してください。"
    puts "（投入金額:#{@account.slot_money}円)"
    drink_info
    print " <= "
    gets.to_i
  end

  def start
    puts "\n自販機へようこそ!"
    while true
      puts "\n何をしますか？"
      menu = select_menu
      while true
        case menu
        when 1
          puts "\n商品はこちら"
          drink_info
          puts "\n何をしますか？"
          menu = select_menu
        when 2
          puts "\n何円投入しますか？ ※ 10,50,100,500,1000のいずれか"
          print " <= "
          money = gets.to_i
          slot_money(money)
          while true
            buyable_drink = []
            @drinks.each do |drink|
              if @account.slot_money >= drink.price && drink.stock > 0
                buyable_drink << drink.name
              end
            end

            case buyable_drink.size
            when (1..)
              puts "下記#{buyable_drink.size}種類が購入可能です。"
              puts buyable_drink
              break
            when 0
              puts "お金をさらに投入してください。"
              puts "\n何円投入しますか？ ※ 10,50,100,500,1000のいずれか"
              print " <= "
              slot_money(gets.to_i)
            end
          end

          puts "\nどうしますか？"
          puts "1: ドリンクを購入する\n2: お金をさらに投入する"
          print " <= "
          if gets.to_i == 1
            break
          end
        when 3
          puts "\nご利用ありがとうございました。またのご利用お待ちしております。"
          puts "(今回の売上#{@account.sales_money}円)"
          return
        else
          puts "\n1〜3の数字を入力してください"
          menu = select_menu
        end
      end
      drink_choice = select_drink
      num = @drinks.size
      while true
        case drink_choice
        when (1..num)
          drink = @drinks[drink_choice - 1]
          if drink.stock == 0
            puts "\n#{drink.name}は在庫が0です。"
            drink_choice = select_drink
          elsif @account.slot_money < drink.price
            puts "\n投入金額が#{drink.price - @account.slot_money}円足りません。"
            #ここでお金を投入するルートを増やしても良いかも
            drink_choice = select_drink
          else
            puts "\n#{drink.name}をどうぞ！"
            buy_drink(drink)
            @account.return_money
            break
          end
        else
          puts "\n1〜#{num}の数字を入力してください"
          drink_info
          print " <= "
          drink_choice = gets.to_i
        end
      end
    end
  end
end

Navigator.new.start
