class Stocker
  attr_reader :name, :price, :stock

  # 今回はすべて在庫(stock)5個なので、デフォルト値を5に設定
  def initialize(name:, price:, stock: 5)
    @name = name
    @price = price
    @stock = stock
  end

  # 在庫増減
  def store(num)
    @stock += num
  end
end
