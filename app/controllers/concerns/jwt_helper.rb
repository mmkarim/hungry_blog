module JwtHelper
  def valid_jwt? jwt
    email = Auth.decode(jwt)["email"]
    if admin_signed_in? && current_admin.email == email
      true
    else
      false
    end
  end
end
