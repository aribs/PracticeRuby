def DashInsertII(num)
	str=''
	[1,2,3,4,5]
	cont = num.length

	for i  in 0..cont - 1
		if i === cont -1
			str.concat num[i]
		else
			if num[i].to_i % 2 == 0 && num[i+1].to_i % 2 == 0
			str.concat num[i]
			str.concat '*'
		
			elsif num[i].to_i % 2 != 0 && num[i+1].to_i % 2 != 0
				str.concat num[i]
				str.concat '-'
			else
				str.concat num[i]
			end

		end
	 
	 end
	puts str
 return str


end

prueba = DashInsertII('2235374421334')
