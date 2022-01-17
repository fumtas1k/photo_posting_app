class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    flash[:notice] = "#{favorite.picture.user.first_name}さんの投稿をお気に入り登録しました!"
    redirect_back fallback_location: pictures_path
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:danger] = "#{favorite.picture.user.first_name}さんの投稿をお気に入り解除しました!"
    redirect_back fallback_location: pictures_path
  end
end
