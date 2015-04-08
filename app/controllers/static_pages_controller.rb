class StaticPagesController < ApplicationController
  before_action :require_signed_in

  def root
    render :root
  end

  private

  def require_signed_in
    redirect_to new_session_url unless signed_in?
  end
end
