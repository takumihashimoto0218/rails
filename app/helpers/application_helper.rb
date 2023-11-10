module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when 'success'
      'success' # 緑色
    when 'error'
      'danger'  # 赤色
    when 'alert'
      'warning' # 黄色
    when 'notice'
      'info'    # 青色
    else
      flash_type.to_s
    end
  end

  def display_search_form?
    allowed_paths = [
      'boards#index',
      'profiles#show',
      'packs#index'
    ]

    allowed_paths.include?("#{controller_name}##{action_name}")
  end

  def search_form_action
    case controller_name
    when 'boards'
      boards_path
    when 'profiles'
      profile_path(current_user.profile) # 現在のユーザーのプロフィールページへのパス
    when 'packs'
      packs_path
    else
      root_path
    end
  end
end
