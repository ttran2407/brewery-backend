# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'rest-client'

page = 1

# url = "https://api.openbrewerydb.org/breweries?by_state=pennsylvania&page=#{page}&per_page=50"

while page < 9 do

    url = "https://api.openbrewerydb.org/breweries?by_state=pennsylvania&page=#{page}&per_page=50"

    data = JSON.parse(RestClient.get(url).body)
    data.each do |brewery|
        Brewery.create(
            name: brewery['name'],
            brewery_type: brewery['brewery_type'],
            street: brewery['street'],
            city: brewery['city'],
            state: brewery['state'],
            postal_code: brewery['postal_code'],
            country: brewery['country'],
            longitude: brewery['longitude'],
            latitude: brewery['latitude'],
            phone: brewery['phone'],
            website_url: brewery['website_url'],
            rating: 5,
            
        )
    end

    page += 1
end

