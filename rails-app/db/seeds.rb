# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#user = User.create(username: "admin", password: "admin", age: 32)

def get_api_data
    response = RestClient.get 'https://api.thecatapi.com/v1/breeds'
    json_data = JSON.parse response

    if json_data.nil?
        json_data["data"].map do |breed|
            Breed.create(
                name: "#{breed["name"]}"
            )
        end
    else
        puts "error seeding breeds"
    end
end