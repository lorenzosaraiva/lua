function boo()
	for i = 1, 10 do
		local a
		local f = function () return a end
 	end
end

function foo()
	while true do
		X::for i = 1,10 do
			for i = 1,10 do
				for i = 1,10 do
					for i = 1,10 do
						for i = 1, 10 do
							break X
						end
					end
					local a
					local f = function () return a end
				end
			end
		end
	end
end


function moo()
	while true do
		X::for i = 1,10 do
			for i = 1,10 do
				for i = 1,10 do
					for i = 1,10 do
						for i = 1, 10 do
							if i > 5 then
								break X
							end
							local a
							local f = function () return a end
						end
					end
				end
			end
		end
	end
end

function goo()
	while true do
		X::for i = 1,10 do
			for i = 1,10 do
				for i = 1,10 do
					for i = 1,10 do
						for i = 1, 10 do
							if i > 5 then
								break X
							end
						end
					end
				end
			end
		end
	end
end

function loo()
	while true do
		X::for i = 1,10 do
			for i = 1,10 do
				for i = 1,10 do
					for i = 1,10 do
						for i = 1, 10 do
							if i > 5 then
								break X
							end
							local a
							local f = function () return a end
						end
					end
					break
				end
			end
		end
	end
end


function noo()
	X::do
	  do
	    Y::do
	  	  do
		  	do
		  	   local x <close> = nil
		  	   break Y
		  	end
	  	  end
	    end
	    break X
	  end
	end
end

local x = 0
function zoo()
	X::for i = 1,10 do
		for i = 1,10 do
			for i = 1,10 do		
				break X
			end
		local a
		local f <close> = nil
		end
	end
end

function f1()
	local x=1
	for i = 1, 10 do
		local f <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
		x=1	
	end
end

function f2()
	local y = 10
	X::for i = 1,10 do
		for i = 1,10 do
			for i = 1,10 do		
				for i = 1,10 do
					for i = 1, 10 do	
						if i > 2 then
							break X
						end	
					end
				end
				local a
				local f = function () return a end
				--local f <close> = setmetatable({}, {__close = function () assert(x == 1); x = 2; end})
				--assert(x == 0)
				x = 1
				local g = function () return y end
			end
		end
	end
end

function f3()
	X::for i = 1,10 do
		for i = 1,10 do
			for i = 1,10 do		
				for i = 1,10 do
					for i = 1, 10 do	
						if i > 2 then
							break X
						end	
					end
				end
				local a
				local f = function () return a end
			end
		end
	end
end

function f4()
	X::for i = 1,10 do		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
		end
		local a
		local f = function () return a end
	end
end

function f5()
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
end

function f6()
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
end


function f7()
	X::for i = 1,10 do		
		for i = 1,10 do
			for i = 1, 10 do
				break 
			end
		end
		local a
		local f = function () return a end
	end
end

function f8()
	X::for i = 1,10 do
		do		
			for i = 1,10 do
				for i = 1, 10 do
					break X
				end
			end
			local a
			local f = function () return a end
			
		end
	end
end


function f9()
	X::for i = 1,10 do		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
			local a
			local f = function () return a end
		end
	end
end


function f10()
	X::for i = 1,10 do		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
			local a <close> = 0
		end
	end
end

function f11()
	X::do	
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
		end
		local a <close> = 0
	end
end

function f12()
	X::for i = 1,10 do
	local a = 0
	::y::		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
		end
		local f = function () return a end
		goto y
	end
end

function f13()
	X::repeat		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
			local a <close> = 0
		end
		local a <close> = 0
	until (false)
end


function f14()
	X::while(true) do		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
		end
		local a <close> = 0
	end
end

function f15()
	X::repeat		
		for i = 1,10 do
			for i = 1, 10 do
				break X
			end
			local a <close> = 0
		end
	until (false)
end

function f16()
	X::while(true) do
		local a <close> = 0
	end
end


function f17()
	X::for i=1, 10 do
		local a <close> = 0
	end
end

function f18()
	X::for i = 1,10 do		
		for i = 1,10 do
			for i = 1, 10 do
				break 
			end
		end
		local a <close> = 0
	end
end



T.printcode(f12)