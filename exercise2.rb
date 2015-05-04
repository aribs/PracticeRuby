def NumberEncoding(str)
	str.downcase!
	stringNumber = ""
	for i in 0..str.length - 1
		number = calcAscii(str[i])
		number = number.to_s
		stringNumber.concat number
	end
	

  return stringNumber 

end

def calcAscii(letter)
	nleter = letter.ord
	if nleter >= 97 && nleter <= 122
		nleter = nleter - 96
		return nleter
	else
		return letter
	end
end




puts NumberEncoding('abcd*hola')
puts NumberEncoding('hello 45')  == '85121215 45'
puts NumberEncoding('jaj-a')  == '10110-1'