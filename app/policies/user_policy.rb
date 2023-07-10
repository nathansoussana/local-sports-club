class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    user.id == record.id
  end

  def destroy?
    user.id == record.id
  end
end
