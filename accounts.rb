class Account

	def initialize user, pasword, website
		@user = user
		@pasword = pasword
		@website = website
	end
	def view_account
		puts "User: #{@user}, pasword: #{@pasword}, website: #{@website} "
	end
	def encrypt_pasword
		encrypted_p = ""
		for i in 0..@pasword.length - 1
			encrypted_p << @pasword[i].ord + 3
		end
		@encrypted = encrypted_p
		return encrypted_p
	end
	def decrypt_pasword
		decrypted_p = ""
		for i in 0..@encrypted.length - 1
			decrypted_p << @encrypted[i].ord - 3
		end
		return decrypted_p
	end


end
myFacebook = Account.new "alejo", "contrasena", "facebook.com"
google = Account.new "userAlejo", "mypasword", "google.com"

puts myFacebook.view_account
puts google.view_account
puts myFacebook.encrypt_pasword
puts myFacebook.decrypt_pasword
