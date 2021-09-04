class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def transfer(amount, user)

  end

  def withdraw(amount)

  end
end
