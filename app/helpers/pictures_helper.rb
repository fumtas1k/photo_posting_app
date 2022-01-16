module PicturesHelper
  def choose_new_or_edit
    if %w[new create confirm].include?(action_name)
      confirm_pictures_path
    elsif action_name == "edit"
      picture_path
    end
  end
end
