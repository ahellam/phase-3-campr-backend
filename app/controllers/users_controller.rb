require 'pry'
class UsersController < ApplicationController

    get "/users" do
        User.all.to_json
    end

    get "/users/:id" do
        User.find(params[:id]).to_json
    end

    post "/users" do
        user = User.create(
            name: params[:name],
            email: params[:email]
        )
        user.to_json
    end

    # patch "/users/:id" do
    #     user = User.find(params[:id])
    #     allowed_attrs_to_update = params.select{|k,v| ["name", "email"].include?(k)}
    #     user.update(params)
    #     user.to_json
    # end

    delete "/users/:id" do
        User.find(params[:id]).destroy
    end

end