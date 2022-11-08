# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?
  helper_method :current_account
  helper_method :clarencehouse?

  # Mocked from real app
  def current_user
    User.first!
  end

  alias user_signed_in? current_user

  # Mocked from real app
  def current_account
    current_user.accounts.first
  end

  # Mocked from real app
  def clarencehouse?
    false
  end
end
