j = 0
loop1::while(j < 10) do
  loop2::for i=0, 10 do
    print(i) 
    break loop1
  end
  j = j + 1
end


x::do
  for i=1, 10 do
    print(i)
    break x
  end
end

for i=1, 10 do
  print("loop")
  do
    break
  end
end



p::for i=2, 10 do
  print(i)
  if false then
    print("what")
  else
    break p
  end
end

p::for i=3, 10 do
  print(i)
  if true then
    break p
  else
    print("what")
  end
end

x::do
  k::for j=0, 10 do
    for i=1, 10 do
      break k
    end
  end
  print("4")
end

e::do
  for i=0, 10 do
    --print(i)
    do
      for j=1,10 do
        --print(j)
        break
      end
    end
  end
  print("5")
end

e::do
  for i=0, 10 do
    --print(i)
    do
      for j=1,10 do
        --print(j)
        break e
      end
    end
  end
  print("erro")
end

x::do
  k::for j=1, 10 do
    for i=1, 10 do
      break x
    end
  end
  print("erro")
end

x::do
  k::for j=1, 4 do
  --print("loop")
    for i=1, 10 do
      break
    end
  end
end


-- TESTING THE BREAK GOTOLABEL
-- 1 - Simple for, no label
p::for i = 0, 5 do
  --if i > 3 then
  break
  --end
end

-- 2 - Simple for, label
a::for i = 0, 5 do
  break a
end

-- 3 - Nested for, no label

control1 = false
control2 = false

for i = 0, 10 do
  if i > 3 then
    control1 = true
  end
  for j = 0, 10 do
    if j > 3 then
      control2 = true
    end
  	for k = 0, 10 do
      break    
  	end
  end
end

if ((control2 == false) or (control1 == false)) then
  print("Erro no teste 3 - break terminou loops indevidos.")
end

control1 = false
control2 = false

-- 4- Nested for, label

b::for i = 0, 10 do
  if i > 3 then
    control1 = true
  end
  for j = 0, 10 do
    if j > 3 then
      control2 = true
    end
    for k = 0, 10 do
      break b  
      print("Erro no teste 4 - ignorou break")
    end
  end
end

if ((control2 == true) or (control1 == true)) then
  print("Erro no teste 4 - break terminou loops indevidos.")
end

-- 5- Nested for, label to middle for-loop

control1 = false
control2 = false


for i = 0, 10 do
  if i > 3 then
    control1 = true
  end
  c::for j = 0, 10 do
    if j > 3 then
      control2 = true
    end
    for k = 0, 10 do
      break c  
      print("Erro no teste 5 - ignorou break")
    end
  end
end

if ((control2 == true) or (control1 == false)) then
  print("Erro no teste 5")
end

-- 6- 
a = 0
a::repeat
  for i = 0, 10 do
	a = a + 1
	break a
  end
until (a > 4)

if (a > 1) then
  print("Erro no teste 6")
end

print("test final")
j=0
a::for i = 0, 10 do
  b::while j < 10 do	
  	j = j + 1
    c::repeat 
      break
    until (j > 10000)
    --print(j)
  end
end


print("End of tests")
