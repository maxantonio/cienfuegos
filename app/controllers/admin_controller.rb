class AdminController < ApplicationController
  USERS = { "admin" => "admin" }

  before_action :authenticate

  def index
  end

  private

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end
end
