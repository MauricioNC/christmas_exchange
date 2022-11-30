module Link
  extend ActiveSupport::Concern

  def generate_link(link_params = {})
    "group/#{link_params[:model]}/#{link_params[:token]}"
  end
end
