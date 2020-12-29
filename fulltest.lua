--- TESTE

--- Testando ordem dos closes

local x = 0
do
	local y <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
	assert(x == 0)
	x = 1
end
assert(x == 2)

x = 0
for i=1, 10 do 
	local y <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
	assert(x == 0)
	x = 1
	break
end
assert(x == 2)


x = 0
while(true) do 
	local y <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
	assert(x == 0)
	x = 1
	break
end
assert(x == 2)

x = 0
repeat 
	local y <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
	assert(x == 0)
	x = 1
	break
until(false)
assert(x == 2)

x = 0
B::for i=1, 10 do 
	local y <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
	assert(x == 0)
	x = 1
	break B
end
assert(x == 2)

x = 0
a::for i = 1,10 do
	for i = 1,10 do
		for i = 1,10 do
			local f <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
			assert(x == 0)
			x = 1	
			for i = 1,10 do
				for i = 1, 10 do	
					break a
				end
			end
		end
	end
end

assert(x == 2)

x = 0
a::for i = 1,10 do
	for i = 1,10 do
		for i = 1,10 do
			local f <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
			assert(x == 0)
			x = 1	
			for i = 1,10 do
				for i = 1, 10 do	
					break a
				end
			end
			break
		end
	end
end

assert(x == 2)

local x=0
for i = 1, 10 do
	local f <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
	x=1
	break	
end
assert(x == 2)
x=0

X::for i = 1,10 do
	for i = 1,10 do
		for i = 1,10 do
			for i = 1,10 do
				for i = 1, 10 do
					if i > 2 then
						break X
					end
					if i == 1 then
						local f <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
						x = 1
					end
				end
			end
		end
	end
end

assert(x == 2)



x = 0
X::for i = 1,10 do
	for j = 1,10 do
		do		
			for i = 1,10 do
				for i = 1, 10 do	
					if j > 2 then
						break X
					end	
				end
			end
			if j == 1 then
				local f <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
				assert(x == 0)
				x = 1
			end		
		end
	end
end
assert(x == 2)


--- Teste de funcionamento do break

j = 0
loop1::while(j < 10) do
  loop2::for i=0, 10 do
    break loop1
  end
  j = j + 1
end
assert(j == 0)


loop1::while(j < 10) do
  loop2::for i=0, 10 do
    break loop2
  end
  j = j + 1
end
assert(j == 10)

j = 0
loop1::while(j < 10) do
  loop2::for i=0, 10 do
    do
    	break loop1
    end
  end
  j = j + 1
end
assert(j == 0)

loop1::while(j < 10) do
  loop2::for i=0, 10 do
 	do
    	break loop2
    end
  end
  j = j + 1
end
assert(j == 10)

j = 0

loop1::while(j < 10) do
  loop2::for i=0, 10 do
 	do
    	break
    end
  end
  j = j + 1
end
assert(j == 10)


j = 0
x::do
  for i=1, 10 do
    j = j + 1
    break x
  end
end
assert(j == 1)

j = 0
x::while(true) do
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
  j = i
  do
    break
  end
end
assert(j == 1)
j=0
while true do
  j=1
  do
    break
  end
  j=3
end
assert(j==1)

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
--Caso o break nao tenha label, quebra o loop mais interno
--Caso o break tenha label, quebra o bloco mais interno com o label
for i=1, 10 do
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
      break;
    end
  end
end
assert(j == 4)


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
      break;    
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
      break c; 
    end
  end
end

assert((control2 == false) and (control1 == true))

a = 0
a::repeat
  for i = 0, 10 do
	a = a + 1
	break a;
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

local i = 0
X::while i < 10 do
	do
	local a
	local f = function () return a end
		repeat		
			break X
		until (i > 10)
	end
end

-- testing opcodes

-- check that 'f' opcodes match '...'
function check (f, ...)
  local arg = {...}
  local c = T.listcode(f)
  for i=1, #arg do
    local opcode = string.match(c[i], "%u%w+")
    -- print(arg[i], opcode)
    assert(arg[i] == opcode)
  end
  assert(c[#arg+2] == undef)
end


check(function ()
  X::for i = 1,10 do		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
		end
		local a
		local f = function () return a end
	end
end,
  'LOADI', 'LOADI', 'LOADI', 'FORPREP',
  'LOADI', 'LOADI', 'LOADI', 'FORPREP', 
  'LOADI', 'LOADI', 'LOADI', 'FORPREP', 
  'JMP', 'FORLOOP', 'FORLOOP', 'LOADNIL', 
  'CLOSURE', 'CLOSE', 'FORLOOP', 'CLOSE', 'RETURN')

check(function ()
  X::for i = 1,10 do		
		for i = 1,10 do
			for i = 1, 10 do
				break 
			end
		end
		local a
		local f = function () return a end
	end
end,
  'LOADI', 'LOADI', 'LOADI', 'FORPREP',
  'LOADI', 'LOADI', 'LOADI', 'FORPREP', 
  'LOADI', 'LOADI', 'LOADI', 'FORPREP', 
  'JMP', 'FORLOOP', 'FORLOOP', 'LOADNIL', 
  'CLOSURE', 'CLOSE', 'FORLOOP', 'RETURN')

check(function () -- CLOSE A MAIS??
  local y
	X::for i = 1,10 do		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
		end
		local a
		local f = function () return a end
		local g = function () return y end
	end
end,
  'LOADNIL','LOADI', 'LOADI', 'LOADI', 'FORPREP',
  'LOADI', 'LOADI', 'LOADI', 'FORPREP', 
  'LOADI', 'LOADI', 'LOADI', 'FORPREP', 
  'JMP', 'FORLOOP', 'FORLOOP', 'LOADNIL', 
  'CLOSURE', 'CLOSURE', 'CLOSE', 'FORLOOP',
   'CLOSE', 'RETURN','CLOSE')

check(function ()
  	local i = 0
	X::while i < 10 do
		do
			local a
			local f = function () return a end
			repeat		
				break X
			until (i > 10)
		end
	end
end,
  'LOADI', 'LTI', 'JMP', 'LOADNIL',
  'CLOSURE', 'JMP', 'GTI', 'JMP', 	 
  'CLOSE', 'JMP', 'CLOSE', 'RETURN')


--- Label não encontrado

a::for i=1,10 do
  --break X;	
end

a::for i=1,10 do
  --break missing;	
end


--- Erros de sintaxe 

a::for i=1,10 do
  break a;	
  --local x = 0
end

a::for i=1,10 do
  break a	
  --local x = 0
end

for i=1,10 do
  break;	
  local x = 0
end

for i=1,10 do
  break;
  x = 0
end

x::for i = 1,10 do
	x::for j = 1, 10 do
	
	end
end

print("End of tests")
