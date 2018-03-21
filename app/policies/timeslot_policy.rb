class TimeslotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      end
      if user.test
        scope.all.select{|timeslot| user.activities.include?(timeslot.activity) }
      end
    end
  end

  def show?
    user.test || user.admin
  end

  def create?
    user.test || user.admin
  end

    # def update?
    # record.user == user.test || user.admin
    # # - record: the timeslot passed to the `authorize` method in controller
    # # - user:   the `current_user` signed in with Devise.
    # end

    # def destroy?
    #   record.user == user.test || user.admin
    # end
end
