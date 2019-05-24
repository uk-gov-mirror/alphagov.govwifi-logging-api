require 'date'

class Gdpr::UseCase::PopulateUserLastLogin
  def initialize(session_gateway:, last_login_gateway:)
    @session_gateway = session_gateway
    @last_login_gateway = last_login_gateway
  end

  def execute(date: Date.today)
    usernames = session_gateway.active_users(date: date)
    last_login_gateway.set(date: date, usernames: usernames)
  end

private

  attr_reader :session_gateway, :last_login_gateway
end
