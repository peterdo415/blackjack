# 1
def hello
  puts "Hello World"
end

hello

# 2
def greeting(name)
  puts "おはよう、、#{name}!"
end

greeting("おれ")

# 変数
# 1
def area(x, y)
  puts x * y
end

area(3, 8)

# 条件分岐
# 1
def greater(x, y)
  if x > y then
    p "x > y"
  elsif x < y then
    p "x < y"
  else
    p "x == y"
  end
end

greater(5, 9)

# 2
def train_fare(age)
  if age >= 12 then
    p 200
  elsif age < 12 && age >= 6
    p 100
  else
    p 0
  end
end

train_fare(12)
train_fare(6)
train_fare(5)

# 3
def xor(x, y)
  if x == true || y == true
    p true
  else
    p false
  end
end

xor(true, true)
xor(true, false)
xor(false, true)
xor(false, false)
