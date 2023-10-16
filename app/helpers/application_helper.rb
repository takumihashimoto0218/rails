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
end
