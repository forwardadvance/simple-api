class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.

  # def cors_set_access_control_headers
  #   header["Access-Control-Allow-Origin: *"];
  #   header['Access-Control-Allow-Credentials: true'];
  #   header["Access-Control-Allow-Methods: GET, POST, OPTIONS"];
  # end

end
