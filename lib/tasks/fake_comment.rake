namespace :dev do

	task fake_comment: :environment do

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
end
