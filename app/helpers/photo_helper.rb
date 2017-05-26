module PhotoHelper
  def favorited_class(photo, user)
    Favorite.find_by(photo: photo, user: user) ? "favorited" : ""
  end
end
