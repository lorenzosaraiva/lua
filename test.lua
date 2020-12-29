j = 0
loop1::while(j < 10) do
  loop2::for i=0, 10 do
    break loop1
  end
  j = j + 1
end
assert(j == 0)

x::do
  for i=1, 10 do
    j = i
    break x
  end
end
assert(j == 1)

for i=1, 10 do
  if i > 2 then
    do
      j = i
      break
    end
  end
end
assert(j == 3)


for i=1, 10 do
  do
    j = i
    break
  end
end
assert(j == 1)

j = 0
a::for i=1,10 do
  j=i
  break;  
end
assert(j == 1)

j = 0
p::for i=2, 10 do
  j = i
  if false then
    assert(1 == 0)
  else
    break p
  end
end
assert(j == 2)

j = 0
p::for i=3, 10 do
  j = i
  if true then
    break p
  else
    assert(1 == 0)
  end
end
assert(j == 3)

x::do
  k::for i=0, 10 do
    for i=1, 10 do
      break k
    end
  end
  j = 10
end
assert(j == 10)
-----
e::do
  for i=0, 10 do
    do
      for k=1,10 do
        break
      end
    end
  end
  j = 1
end

assert(j == 1)

e::do
  for i=0, 10 do
    do
      for k=1,10 do
        break e
      end
    end
  end
  j = 2
end
assert(j == 1)

x::do
  k::for l=1, 10 do
    for i=1, 10 do
      break x
    end
  end
  j = 2
end
assert(j == 1)

x::do
  k::for l=1, 4 do
    j = l
    for i=1, 10 do
      break
    end
  end
end
assert(j == 4)


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

assert((control2 == true) and (control1 == true)) 
control1 = false
control2 = false

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
    end
  end
end

assert((control2 == false) and (control1 == false))

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
    end
  end
end

assert((control2 == false) and (control1 == true))

a = 0
a::repeat
  for i = 0, 10 do
	a = a + 1
	break a
  end
until (a > 4)

assert(a <= 1)

j=0
a::for i = 0, 10 do
  b::while j < 10 do	
  	j = j + 1
    c::repeat 
      break
    until (j > 10000)
  end
end
assert(j == 10)

print("End of tests")

