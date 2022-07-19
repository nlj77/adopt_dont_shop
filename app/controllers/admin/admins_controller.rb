class AdminsController < ApplicationController
    def index 
        @applications = Shelter.reverse_alphabetical
    end
    def show 
        @applicant = Applicant.find(params[:id])
        @pets = @application.pets
    end
    
end
