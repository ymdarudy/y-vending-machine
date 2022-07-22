require_relative "accounting"
require_relative "stocker"

class Navigator
  def initialize
    @account = Accounting.new
    @drinks = []
    @drinks << @cola = Stocker.new(name: "コーラ", price: 120)
    @drinks << @red_bull = Stocker.new(name: "レッドブル", price: 200)
    @drinks << @water = Stocker.new(name: "水", price: 100)
  end

  def select_menu
    puts "\n何をしますか？"
    puts "1: 商品を確認する\n2: お金を入れる\n3: 立ち去る"
    print " <= "
    gets.to_i
  end

  def drink_info
    @drinks.each_with_index do |drink, i|
      puts "#{i + 1}: #{drink.name}, #{drink.price}円, 在庫:#{drink.stock}"
    end
  end

  def select_drink
    puts "\n購入したいドリンクの番号を選択してください。"
    puts "（投入金額:#{@account.amount}円)"
    drink_info
    print " <= "
    gets.to_i
  end

  def buy_drink(drink)
    drink.store(-1)
    @account.add_amount(-drink.price)
    @account.add_sales_money(drink.price)
  end

  def start
    puts "\n自販機へようこそ!"
    while true
      menu = select_menu
      while true
        case menu
        when 1
          puts "\n商品はこちら"
          drink_info
          menu = select_menu
        when 2
          @account.slot_money
          while true
            buyable_drink = []
            @drinks.each do |drink|
              if @account.amount >= drink.price && drink.stock > 0
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
              @account.slot_money
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
      while true
        case drink_choice
        when (1..@drinks.size)
          drink = @drinks[drink_choice - 1]
          if drink.stock == 0
            puts "\n#{drink.name}は在庫が0です。"
            drink_choice = select_drink
          elsif @account.amount < drink.price
            puts "\n投入金額が#{drink.price - @account.amount}円足りません。"
            drink_choice = select_drink
          else
            puts "\n#{drink.name}をどうぞ！"
            buy_drink(drink)
            @account.return_money
            break
          end
        else
          puts "\n1〜#{@drinks.size}の数字を入力してください"
          drink_info
          print " <= "
          drink_choice = gets.to_i
        end
      end
    end
  end
end

Navigator.new.start
