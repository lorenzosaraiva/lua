
T = debug.getinfo (foo,"L")
function foo()
	X::for i = 1,10 do
		for i = 1,10 do
			for i = 1,10 do
				for i = 1,10 do
					for i = 1, 10 do
						break X
					end
				end
				local a = 10
				usevar(a)
			end
			--CLOSE, sempre
		end
	end
	--CLOSE, pelo break
end

function usevar(a)
	a = a+1
end

T.printcode(foo)