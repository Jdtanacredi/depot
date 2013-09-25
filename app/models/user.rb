class User < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_secure_password

# Makes sure last admin account can't be deleted. also marked in controller
private
	def ensure_an_admin_remains
		if User.count.zero?
			raise "Can't delete last user"
		end
	end


end
