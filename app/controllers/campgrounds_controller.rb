class CampgroundsController < ApplicationController

    get "/campgrounds" do
        Campground.all.to_json
    end

    get "/campgrounds/:id" do
        Campground.find(params[:id]).to_json
    end

    post "/campgrounds" do
        campground = Campground.create(
            camp_name: params[:camp_name],
            is_full: params[:is_full]
        )
        campground.to_json
    end

    # patch "/campgrounds/:id" do
    #     campground = Campground.find(params[:id])
    #     campground.update(params)
    #     campground.to_json
    # end

    delete "/campgrounds/:id" do
        Campground.find(params[:id]).destroy
    end
end