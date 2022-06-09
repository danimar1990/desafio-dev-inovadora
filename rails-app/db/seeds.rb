def get_breeds
	response = RestClient.get 'https://api.thecatapi.com/v1/breeds'
	json = JSON.parse response
	if !json.nil?
		json["data"].map do |b|
			Breed.create(shortname: b.id)
		end
	else
		puts 'Error seeding breeds!'
	end
end