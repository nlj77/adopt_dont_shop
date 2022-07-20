class AdminsController < ApplicationController
    def index 
        @shelters = Shelter.reverse_alphabetical
        @pending_shelters = Shelter.pending_applications
    end

    def show 
        @applicant = Applicant.find(params[:id])
        # @pets = @application.pets
    end
    
end
