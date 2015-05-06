class Account
	attr_accessor 
	@@count_psw_bad = 0
	def initialize user, pasword, website
		@user = user
		@pasword = pasword
		@website = website 
		encrypt_pasword
		save_account

	end
	def view_account
		if @pasword.length >= 5
			puts "User: #{@user}, pasword: #{@encrypted}, website: #{@website} "
		else
			@@count_psw_bad += 1
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
	def self.view_insegure
		puts "You have a #{@@count_psw_bad} insegure paswords"
	end
	def save_account
		text_saved = IO.read("accounts.txt") + "\n " + @user + "\n " + @encrypted +"\n " +  @website + "\n " 
		IO.write("accounts.txt", text_saved) 
	end 


end
myFacebook = Account.new "alejo", "contrasena", "facebook.com"
google = Account.new "userAlejo", "mypasword", "google.com"
twitter = Account.new "twtAlejo", "abc", "twitter.com"

puts myFacebook.view_account
puts google.view_account
puts google.decrypt_pasword
puts google.view_account
puts twitter.view_account
puts google.decrypt_pasword
Account.view_insegure
