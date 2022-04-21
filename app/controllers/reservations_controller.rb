class ReservationsController < ApplicationController

    get "/reservations" do
        Reservation.all.to_json
    end

    get "/reservations/:id" do
        Reservation.find(params[:id]).to_json
    end


    post "/reservations" do
        campsite = Campsite.find(params[:campsite_id])
        total_days = (params[:end_date].to_date - params[:start_date].to_date).to_i
        price_total = campsite.daily_price * total_days

        reservation = Reservation.create(
            user_id: params[:user_id],
            campsite_id: params[:campsite_id],
            start_date: params[:start_date],
            end_date: params[:end_date],
            price_total: price_total
        )
        reservation.to_json
    end

    # patch "/reservations/:id" do
        # Advance Deliverable 1: update start_date and end_date
        # Advance Deliverable 2: campsite_id

        # attrs_to_update = params.select{|k,v| ["name", "email"].include?(k)}
    # end

    delete "/reservations/:id" do
        Reservation.find(params[:id]).destroy
    end
end