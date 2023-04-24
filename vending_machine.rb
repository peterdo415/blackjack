class VendingMachine
  def initialize(press_manufacturer_name)
    @press_manufacturer_name = press_manufacturer_name
    @deposit_coin = 0
  end

  def deposit_coin(amount)
    if amount == 100
      @deposit_coin += amount 
    else
      p "100円コインしか入れられません。"
    end
  end

  def press_button(drink)
    if @deposit_coin > drink.price
      @deposit_coin -= drink.price
      p drink.name
    else
      p ""
    end
  end

  private
  def press_manufacturer_name
    @press_manufacturer_name
  end

end

class Item
  attr_reader :name
  def initialize(name:)
    @name = name
  end
end

class Drink < Item
  attr_reader :name
  attr_reader :price
  def initialize(name:, price:)
    @name = name
    @price = price
  end
end

class CupCoffee < Item
  attr_reader :name
  attr_reader :price
  def initialize(name="cup coffee", temp)
    super(name)
    @temp = temp
    @stock = 0
    @price = 100
  end

  def add_cup(qty)
    p = @stock + qty <= 100 ? @stock += qty : "101個以上の在庫は持てません。"
  end
end

hot_cup_coffee = CupCoffee.new('hot');
cider = Drink.new('cider')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)
