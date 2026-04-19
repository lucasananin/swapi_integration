class FavoritesController < ApplicationController
  # def index
  #   @favorites = Favorite.all
  # end

  def index
  @resource = params[:resource]
  @sort = params[:sort] || "created_at"
  @direction = params[:direction] || "desc"

  @favorites = Favorite.all

  # FILTER

  if @resource.present?
    @favorites = @favorites.where(resource: @resource)
  end

  # SORT

  allowed_sorts = %w[name created_at]

  if allowed_sorts.include?(@sort)
    @favorites = @favorites.order("#{@sort} #{@direction}")
  end
  end

  # def create
  #   favorite = Favorite.find_or_initialize_by(person_id: params[:person_id])

  #   favorite.name = params[:name]

  #   if favorite.save
  #     redirect_to favorites_path, notice: "Added to favorites"
  #   else
  #     redirect_back fallback_location: root_path
  #   end
  # end

  # def toggle
  #   person_id = params[:person_id]
  #   favorite = Favorite.find_by(person_id: person_id)

  #   if favorite
  #     favorite.destroy
  #     notice = "Removed from favorites"
  #   else
  #     Favorite.create!(
  #       person_id: person_id,
  #       name: params[:name]
  #     )
  #     notice = "Added to favorites"
  #   end

  #   redirect_back fallback_location: root_path, notice: notice
  # end

  def toggle
  resource = params[:resource]
  external_id = params[:external_id]

  favorite = Favorite.find_by(resource: resource, person_id: external_id)

  if favorite
    favorite.destroy
    notice = "Removed from favorites"
  else
    Favorite.create!(
      resource: resource,
      person_id: external_id,
      name: params[:name]
    )
    notice = "Added to favorites"
  end

  redirect_back fallback_location: root_path, notice: notice
  end

  def destroy
    favorite = Favorite.find[params[:id]]
    favorite.destroy

    redirect_to favorites_path, notice: "Removed from favorites"
  end
end
