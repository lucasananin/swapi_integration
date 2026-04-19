module FavoritesHelper
  # def favorite_for(person_id)
  #   Favorite.find_by(person_id: person_id)
  # end

  # def favorite?(person_id)
  #   favorite_for(person_id).present?
  # end

  def favorite_for(resource, external_id)
    Favorite.find_by(resource: resource, person_id: external_id)
  end

  def favorite?(resource, external_id)
    favorite_for(resource, external_id).present?
  end
end
