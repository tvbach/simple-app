class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  include SessionsHelper

  private
  def render_404
    render file: Rails.root.join("public", "404.html").to_s, layout: false,
           status: :not_found
  end
end
