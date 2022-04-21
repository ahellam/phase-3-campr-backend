require 'pry'
class CampsitesController < ApplicationController

    get "/campsites" do
        Campsite.filter_by_amenities(params).to_json
    end

    get "/campsites/:id" do
        Campsite.find(params[:id]).to_json
    end

    get "/campsites/&:start_date&:end_date" do
        sd = params[:start_date]
        ed = params[:end_date]
        Campsite.filter_by_date_range(sd, ed).to_json
    end

    post "/campsites" do
        campsite = Campsite.create(
            site_number: params[:site_number],
            has_picnic_table: params[:has_picnic_table],
            has_firepit: params[:has_firepit],
            has_bathrooms: params[:has_bathrooms],
            has_rv_hookup: params[:has_rv_hookup],
            daily_price: params[:daily_price],
            campground_id: params[:campground_id]
        )
        campsite.to_json
    end

    delete "/campsites/:id" do
        Campsite.find(params[:id]).destroy
    end
end