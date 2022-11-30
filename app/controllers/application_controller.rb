class ApplicationController < ActionController::Base
  add_flash_types :notice, :success, :error

  include Link
end
