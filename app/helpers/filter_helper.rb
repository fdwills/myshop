module FilterHelper
  def mobile_user_agent?
    @mobile_user_agent ||= request.env["HTTP_USER_AGENT"]
    @mobile_user_agent.include?('Mobile') || @mobile_user_agent.include?('Android')
  end
end
