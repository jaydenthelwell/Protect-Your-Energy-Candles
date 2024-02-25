class SharedController < ApplicationController
  def navbar
    variant = determine_variant
    render "shared/_navbar+#{variant}"
  end

  private

  def determine_variant
    session[:use_mobile] ? 'mobile' : 'desktop'
  end
end
