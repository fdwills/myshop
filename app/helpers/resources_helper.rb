module ResourcesHelper
  def show_resource_state state
    case state
    when 0
      'released'
    when 1
      'draft'
    end
  end
end
