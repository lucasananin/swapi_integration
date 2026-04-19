class PeopleController < ApplicationController
  include PaginationHelper

  def index
    @current_page = (params[:page] || 1).to_i

    data = SwapiClient.get_people(@current_page)
    @people = data["results"]
    @count = data["count"]
    @total_pages = (@count / 10.0).ceil

    window = pagination_window(@current_page, @total_pages)
    @start_page = window[:start_page]
    @end_page = window[:end_page]
  end

  def show
    @person = SwapiClient.get_person(params[:id])
    @favorite = Favorite.find_by(person_id: params[:id])
  end
end
