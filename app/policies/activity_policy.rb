class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      end
      if user.test
        scope.where(user: user)
      end
    end
  end

  def show?
    record.user == user
  end

  def create?
    user_is_test_or_admin

  end

  def update?
    record.user == user.test || user.admin
  # - record: the timeslot passed to the `authorize` method in controller
  # - user:   the `current_user` signed in with Devise.
  end

  # def destroy?
  #   record.user == user.test || user.admin
  # end
end
