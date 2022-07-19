require 'rails_helper'

RSpec.describe "admin application show page" do
# Rejecting a Pet for Adoption
# As a visitor
# When I visit an admin application show page ('/admin/applications/:id')
# For every pet that the application is for, I see a button to reject the application for that specific pet
# When I click that button
# Then I'm taken back to the admin application show page
# And next to the pet that I rejected, I do not see a button to approve or reject this pet
# And instead I see an indicator next to the pet that they have been rejected
    it 'can reject a pet for adoption' do
        new_applicant = Applicant.create!(name: "Test", address: "5555 Test Avenue", city: "Denver", state: "CO", zip: 55555, names_pets_wanted: "Fido", description: "they love pets!", application_status: "In Progress")
        shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
        fido = shelter_1.pets.create(name: 'Fido', breed: 'Beagle', age: 5, adoptable: true)
        ApplicantPet.create!(pet: fido, applicant: new_applicant)
        visit "/admin/applications/#{new_applicant.id}"
        within "#pet_#{pet_1.id}" do
            click_button 'Reject'
        end
    
        expect(current_path).to eq("/admin/applications/#{new_applicant.id}")
    
        within "#pet_#{pet_1.id}" do
            expect(page).to_not have_button('Reject')
            expect(page).to_not have_button('Approve')
            expect(page).to have_content('Rejected')
        end
    end
end