class ResourcesController < ApplicationController
  include PaginationHelper

  def index
    @resource = params[:resource]
    @current_page = (params[:page] || 1).to_i
    @search = params[:search]

    data = SwapiClient.get_resource(@resource, @current_page)
    @items = data["results"]

    # if @search.present?
    #   query = @search.downcase
    #   @items = @items.select do |item|
    #     name = item["name"] ||item["title"]
    #     name.to_s.downcase.include?(query)
    #   end
    # end

    @count = data["count"]
    @total_pages = (@count / 10.0).ceil
    window = pagination_window(@current_page, @total_pages)
    @start_page = window[:start_page]
    @end_page = window[:end_page]
  end

  def show
    @resource = params[:resource]
    @id = params[:id]
    @item = SwapiClient.get_resource_item(@resource, @id)
  end
end
