module Link
  extend ActiveSupport::Concern

  def generate_link(link_params = {})
    if link_params[:group_name]
      return "/#{link_params[:model]}/#{link_params[:group_name]}/#{link_params[:token]}"
    elsif link_params[:participant_name]
      "/#{link_params[:model]}/#{link_params[:participant_name]}/#{link_params[:token]}"
    end
  end
end
