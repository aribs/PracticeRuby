class Account
	attr_accessor 
	def initialize user, pasword, website
		@user = user
		@pasword = pasword
		@website = website 
		encrypt_pasword

	end
	def view_account
		if @pasword.length >= 5
			puts "User: #{@user}, pasword: #{@encrypted}, website: #{@website} "
		else
			 puts "User: #{@user}, pasword: #{@encrypted}, website: #{@website} Caution, your pasword is too short!"
		end
	end
	def encrypt_pasword
		encrypted_p = ""
		for i in 0..@pasword.length - 1
			if @pasword[i].ord <= 120
				encrypted_p << @pasword[i].ord + 3
			else
				encrypted_p << @pasword[i].ord - 4
			end

		end
		@encrypted = encrypted_p
		return encrypted_p
	end
	def decrypt_pasword
		decrypted_p = ""
		for i in 0..@encrypted.length - 1
			if @pasword[i].ord <= 120
				decrypted_p << @encrypted[i].ord - 3
			else
				decrypted_p << @encrypted[i].ord + 4
			end
		end
		return decrypted_p
	end
	def update_pasword psw
		@pasword = psw
		encrypt_pasword
	end
	def update_name name 
		@user = name
	end


end
myFacebook = Account.new "alejo", "contrasena", "facebook.com"
google = Account.new "userAlejo", "mypasword", "google.com"

puts myFacebook.view_account
puts google.view_account
puts google.decrypt_pasword
google.update_pasword "pistachos"
google.update_name "bicicleta"
puts google.view_account
puts google.decrypt_pasword