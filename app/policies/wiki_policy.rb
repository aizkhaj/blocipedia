class WikiPolicy < ApplicationPolicy
  def update?
    user.present? && (user.admin? || (record.user == user))
  end

  def edit?
    update?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def destroy?
    user.present? && (user.admin? || (record.user == user))
  end

  def index?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      # This allows a user to only see private wikis if they are either an admin or premium user.
      if user.admin? || user.premium?
        scope.all
      else
        scope.where(private: false)
      end
    end
  end
end
