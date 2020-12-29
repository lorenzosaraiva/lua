-- local x = 0
-- X::for i = 1,10 do
-- 	for i = 1,10 do
-- 		for i = 1,10 do		
-- 			for i = 1,10 do
-- 				do	
-- 					break X	
-- 				end
-- 			end
-- 		end
-- 	end
-- 	local f <close> = setmetatable({}, {__close = function () assert(x == 1); print("CHAMOU!"); x = 2; end})
-- 	x = 1
-- end

-- assert(x == 2)



-- e::do
--   for i=0, 10 do
--     do
--       for j=1,10 do
--         break e
--       end
--     end
--   end
-- e
y::do
	x::do
		break y	
	end 
end --y
do
	--break
end
i = 0
while(i < 100) do
	i = i + 1
	if i % 3 == 0 then
		break step;
	end
	print(i)
end

while(false) do
	print("loop")
	do
		break;
	end
end


while(false) do
	print("loop3")
	x::do
		print("interno")
		for i= 1,10 do
			break x
		end
	end
end