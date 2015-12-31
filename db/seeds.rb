# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Catalog.destroy_all
Catalog.create([{name: 'Automotive & Parts', url: '#'}])
Catalog.create([{name: 'Computer & Electronics', url: '#'}])
Catalog.create([{name: 'Department Store & Malls', url: '#'}])
Catalog.create({name: 'Food & Drinks', url: '#'})
Catalog.create({name: 'Gifts & Flowers', url: '#'})
Catalog.create({name: 'Home & Garden', url: '#'})
Catalog.create({name: 'Office Supply', url: '#'})
Catalog.create({name: 'Travel & Vacation', url: '#'})
Catalog.create({name: 'Clothing & Accessories', url: '#'})


Merchant.destroy_all
Merchant.create({name: 'Amazon', url: 'http://www.amazon.com'})

TravelSite.destroy_all
TravelSite.create({name: 'Priceline', url: 'http://www.priceline.com'})
