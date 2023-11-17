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
      'packs#index',
      'favorites#index',
      'task_favorites#index'
    ]

    allowed_paths.include?("#{controller_name}##{action_name}")
  end

  def search_form_action
    case controller_name
    when 'boards'
      boards_path
    when 'profiles'
      profile_path(current_user.profile)
    when 'packs'
      packs_path
    when 'favorites'
      user_favorites_path(current_user)
    when 'task_favorites'
      user_task_favorites_path(current_user)
    else
      boards_path
    end
  end

  def search_placeholder
    case "#{controller_name}##{action_name}"
    when 'boards#index'
      'ボードを検索'
    when 'profiles#show'
      'マイボードを検索'
    when 'packs#index'
      'パックを検索'
    when 'favorites#index'
      'ボードを検索する'
    when 'task_favorites#index'
      'タスクを検索する'
    else
      '検索するテキスト'
    end
  end
end
