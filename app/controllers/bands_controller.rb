class BandsController < ApplicationController

    def new
        render :new
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def create
        band = Band.new(band_params)
        #check if band_name exists in bands db
        if !name_taken?(band_params[:name]) && band.save
            redirect_to band_url(band)
        else 
            redirect_to new_band_url
        end
    end

    # def destroy
    #     logout_user!
    #     redirect_to new_band_url
    # end

    private
    def band_params
        params.require(:band).permit(:name)
    end

end
