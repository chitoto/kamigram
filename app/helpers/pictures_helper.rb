module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_pictures_path
    elsif action_name == 'edit' || action_name == 'update'
      confirm_picture_path
    end
  end

  def confirm_new_or_edit
    unless @picture.id? # params[:commit] == 'Create Picture'
      pictures_path
    else
      picture_path
    end
  end

  def confirm_form_method
    if @picture.id == nil
      'post'
    else
      'patch' # 作成時はpost, 編集時は patchを指定
    end
  end
end
