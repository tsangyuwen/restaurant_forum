namespace :dev do

	task fake_user: :environment do

		20.times do |i|
			User.create!(email: FFaker::Internet.free_email,
				password: FFaker::Lorem.words(8)
			)
		end

		puts "have created fake user"
		puts "now you have #{User.count} users data"
	end
end
