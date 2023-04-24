class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{suit}の#{rank}です。"
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    ['スペード', 'ハート', 'ダイヤ', 'クローバー'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A' ].each do |rank|
        @cards << Card.new(suit,rank)
      end
    end
  end

  def shuffule_cards
    cards.shuffle!
  end

  def draw_card
    cards.pop
  end
end

class Player
  attr_reader :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit(card)
    cards << card
  end

  def calcurate_hand
    total = 0
    cards.each do |card|
      if card.rank == 'A'
        total += 11
      elsif card.rank.to_i == 0
        total += 10
      else
        total += card.rank.to_i
      end
    end

    # Aの処理
    cards.select {|card| card.rank == 'A'}.count.times do
      break if total <= 21
      total -= 10
    end
    
    total
  end

  def to_s
    "#{name}の現在の得点は#{calcurate_hand}です。"
  end
end

class Blackjack
  attr_reader :deck, :player, :dealer
  
  def initialize
    @deck = Deck.new
    @player = Player.new('Player')
    @dealer = Player.new('Dealer')
  end

  def deal_card
    for i in 1..2 do
      player.hit(deck.draw_card)
      dealer.hit(deck.draw_card)
      "#{player.name}の引いたカードは#{player.cards.last.suit}の#{player.cards.last.rank}です。"
      if i == 1
        "#{dealer.name}の引いたカードは#{dealer.cards.last.suit}の#{dealer.cards.last.rank}です。"
      else
        "ディーラーの引いた2枚目のカードはわかりません。"
      end
    end
  end

  def player_turn
    while player.calcurate_hand < 21
      "#{player.to_s}カードを引きますか？（Y/N）"
      answer = gets.chomp.upcase
      if answer == 'Y'
        player.hit(deck.draw_card)
        "#{player.name}の引いたカードは#{player.cards.last.suit}の#{player.cards.last.rank}です。"

      elsif answer == 'N'
        break
      else
        "有効な入力ではありません"
      end
    end
  end

  def dealer_turn
    # ディーラーが2枚目に引いたカード
    dealer_second_card = dealer.cards.last
    while dealer.calcurate_hand < 17
      dealer.hit(deck.draw_card)
    end
    "ディーラーの引いた2枚目のカードは#{dealer_second_card.suit}の#{dealer_second_card.rank}でした。"
    dealer.to_s
  end

  def result
    if player.calcurate_hand > 21
      puts "#{player.name}の勝ちです！"
    elsif dealer.calcurate_hand > 21
      puts "#{dealer.name}の勝ちです！"
    elsif player.calcurate_hand > dealer.calcurate_hand
      puts "#{player.name}の勝ちです！"
    elsif player.calcurate_hand < dealer.calcurate_hand
      puts "#{dealer.name}の勝ちです！"
    end
  end

  def play
    deal_card
    player_turn
    dealer_turn
    result
  end
end

game = Blackjack.new
game.play