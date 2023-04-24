# カードをランダムに引く
def your_drow
  card = ["ハート", "ダイヤ", "スペード", "クローバー"].sample
  @your_num = rand(1..13)
  if @your_num >= 10
    @your_point = 10
  elsif @your_num == 1
    @your_point = @your_sum + 11 <= 21 ? 11 : 1
  else
    @your_point = @your_num
  end
  case @your_num
  when 1 then @your_num = "A"
  when 11 then @your_num = "J"
  when 12 then @your_num = "Q"
  when 13 then @your_num = "K"
  end
  p "あなたが引いたカードは#{card}の#{@your_num}です。"
end

def dealer_drow
  @card = ["ハート", "ダイヤ", "スペード", "クローバー"].sample
  @dealer_num = rand(14)
  if @dealer_num >= 10
    @dealer_point = 10
  elsif @dealer_num == 1
    @dealer_point = @dealer_sum + 11 <= 21 ? 11 : 1
  else
    @dealer_point = @dealer_num
  end
  case @dealer_num
  when 1 then @dealer_num = "A"
  when 11 then @dealer_num = "J"
  when 12 then @dealer_num = "Q"
  when 13 then @dealer_num = "K"
  end
end

# カードを引くかどうか
def question
  puts "あなたの現在の得点は#{@your_sum}です。カードを引きますか？（Y/N）"
  @input_answer = gets.chomp
  while @input_answer == "Y" do
    your_drow
    @your_sum += @your_point
    puts "あなたの現在の得点は#{@your_sum}です。カードを引きますか？（Y/N）"
    @input_answer = gets.chomp
  end
end

# 結果
def result
  p "あなたの得点は#{@your_sum}です。"
  p "ディーラーの得点は#{@dealer_sum}です。"
  if @your_sum > 21
    p "ディーラーの勝ちです！"
  elsif
    @dealer_sum > 21
    p "あなたの勝ちです！"
  elsif @your_sum > @dealer_sum
    p "あなたの勝ちです！"
  elsif @your_sum < @dealer_sum
    p "ディーラーの勝ちです！"
  end
end

def blackjack
  @your_sum = 0
  @dealer_sum = 0
  puts "ブラックジャックを開始します。"
  2.times do
    your_drow
    @your_sum += @your_point
  end

  for i in 1..2 do
    dealer_drow
    if i < 2 then
      p "ディーラーが引いたカードは#{@card}の#{@dealer_num}"
    else
      p "ディーラーの引いた2枚目のカードはわかりません。"
      @twice_num = @dealer_num
    end
    @dealer_sum += @dealer_point
  end

  question
  p "ディーラーの引いた2枚目のカードは#{@card}の#{@twice_num}でした。"
  p "ディーラーの現在の得点は#{@dealer_sum}です。"
  while @dealer_sum < 18
    dealer_drow
    p "ディーラーが引いたカードは#{@card}の#{@dealer_num}"
    @dealer_sum += @dealer_point
  end
  
  result
  p "ブラックジャックを終了します。"
end

blackjack