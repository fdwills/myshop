module FilterHelper
  def mobile_user_agent?
    @mobile_user_agent ||= ( request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/] )
  end
end
