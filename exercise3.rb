def PalindromeTwo(str)	
	str.gsub!(/\s+/, '')
	str.downcase!
	str =str.gsub(/[^a-z0-9]/i, '')
	strRev = str.reverse
	if strRev === str
		return true
	else
		return false
	end

end

puts PalindromeTwo('Noel - sees Leon')
puts PalindromeTwo('A war at Tarawa!')
puts PalindromeTwo('La ruta natural')
puts PalindromeTwo('Se van sus naves')


