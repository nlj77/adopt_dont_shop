require 'rails_helper'

RSpec.describe "application show page" do
    #   As a visitor When I visit an applications show page Then I can see the following:
#     Name of the Applicant
#     Full Address of the Applicant including street address, city, state, and zip code
#     Description of why the applicant says they'd be a good home for this pet(s)
#     names of all pets that this application is for (all names of pets should be links to their show page)
#     The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"
    it 'displays the name, full address, description, names of all pets in the application, and the status of the application' do 
        new_applicant = Applicant.create!(name: "Test", address: "5555 Test Avenue, City, State, 55555", name_of_pets: "Fido", description: "they love pets!", application_status: "In Progress")
        visit "/applications/#{application.id}"
        expect(page).to have_content("name: Test")
        expect(page).to have_content("address: 5555 Test Avenue, City, State, 55555")
        expect(page).to have_content("name_of_pets: Fido")
        expect(page).to have_content("application_status: In Progress")
    end 
end