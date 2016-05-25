class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :tracking

  def tracking
    @tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_TOKEN'])
  end
end
