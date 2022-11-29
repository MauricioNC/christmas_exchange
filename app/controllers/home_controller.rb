class HomeController < ApplicationController
  def index
    render new_group_path
  end
end
