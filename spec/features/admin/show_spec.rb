require 'rails_helper'
# As a visitor
# When I visit an admin shelter show page
# Then I see that shelter's name and full address
RSpec.describe 'admin shelter show page' do 
   # it "displays the shelter's name and full address" do 
   #    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
   #    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
   #    @shelter_3 = Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)

   #    visit "/admins/shelters/#{@shelter_1.id}"

   #    expect(page).to have_content("Aurora shelter")
   #    expect(page).to have_content(@shelter_1.city)
   #    expect(page).to_not have_content("Fancy pets of Colorado")
   # end

   it 'can approve a pet for adoption' do
      new_applicant = Applicant.create!(name: "Test", address: "5555 Test Avenue", city: "Denver", state: "CO", zip: 55555, names_pets_wanted: "Fido", description: "they love pets!", application_status: "In Progress")
      shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
      fido = shelter_1.pets.create(name: 'Fido', breed: 'Beagle', age: 5, adoptable: true)
      pepper = shelter_1.pets.create(name: 'Pepper', breed: 'Yorkie', age: 15, adoptable: true)

      ApplicantPet.create!(pet: fido, applicant: new_applicant)

      visit "/admins/applications/#{new_applicant.id}"

      # expect(current_path).to eq("/admins/applications/#{new_applicant.id}")
   
      within("#pet_#{fido.id}") do
         expect(page).to have_button('Reject')
         expect(page).to have_button('Approve')

         click_button 'Approve'

         expect(current_path).to eq("/admins/applications/#{new_applicant.id}")
         expect(page).to have_content("Approved")
      end
   end
end
