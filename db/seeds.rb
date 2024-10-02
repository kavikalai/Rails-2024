# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(:username=>'admin', :password=>'admin123', :first_name=>'Admin', :last_name=>'123', :email=>'kavikalai109@gmail.com', :hashed_password=>"89678e48718f13aebadfc3704a8852e27d16e01f", :salt=>"ez9cnCBV")