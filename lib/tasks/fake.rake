namespace :dev do
	task fake_comment: :environment do

		Comment.destroy_all

		3.times do |i|
			Restaurant.all.each do |r|
				Comment.create!(content: FFaker::Lorem.paragraph,
					restaurant_id: r.id,
					user_id: User.all.sample.id
				)
			end
		end

		puts "have created fake comment"
		puts "now you have #{Comment.count} comment data"
	end

	task fake_restaurant: :environment do

		Restaurant.destroy_all

		500.times do |i|
			Restaurant.create!(name: FFaker::Name.first_name,
				opening_hours: FFaker::Time.datetime,
				tel: FFaker::PhoneNumber.short_phone_number,
				address: FFaker::Address.street_address,
				description: FFaker::Lorem.paragraph,
				category: Category.all.sample
			)
		end

		puts "have created fake restaurants"
		puts "now you have #{Restaurant.count} restaurants data"
	end

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
