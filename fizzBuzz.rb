def divisible3?(num)
	num % 3 === 0
end
def divisible5?(num)
	num % 5 === 0
end
def multiDivisible?(num)
	num % 3 === 0 && num % 5 === 0
end


(1..100).each do |x|
	if multiDivisible?(x)
		puts 'FizzBuzz'
	else
		if divisible3?(x)
			puts 'Fizz'
		elsif divisible5?(x)
			puts 'Buzz'
		else
			puts x
		end
	end
		
end