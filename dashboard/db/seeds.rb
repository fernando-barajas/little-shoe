# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

STORE_STORES = [
  { name: 'ALDO Centre Eaton' },
  { name: 'ALDO Destiny USA Mall' },
  { name: 'ALDO Pheasant Lane Mall' },
  { name: 'ALDO Holyoke Mall' },
  { name: 'ALDO Maine Mall' },
  { name: 'ALDO Crossgates Mall' },
  { name: 'ALDO Burlington Mall' },
  { name: 'ALDO Solomon Pond Mall' },
  { name: 'ALDO Auburn Mall' },
  { name: 'ALDO Waterloo Premium Outlets' }
]

SHOES_MODELS = [
  { name: 'ADERI' },
  { name: 'MIRIRA' },
  { name: 'CAELAN' },
  { name: 'BUTAUD' },
  { name: 'SCHOOLER' },
  { name: 'SODANO' },
  { name: 'MCTYRE' },
  { name: 'CADAUDIA' },
  { name: 'RASIEN' },
  { name: 'WUMA' },
  { name: 'GRELIDIEN' },
  { name: 'CADEVEN' },
  { name: 'SEVIDE' },
  { name: 'ELOILLAN' },
  { name: 'BEODA' },
  { name: 'VENDOGNUS' },
  { name: 'ABOEN' },
  { name: 'ALALIWEN' },
  { name: 'GREG' },
  { name: 'BOZZA' }
]

Store.insert_all(STORE_STORES)
Product.insert_all(SHOES_MODELS)