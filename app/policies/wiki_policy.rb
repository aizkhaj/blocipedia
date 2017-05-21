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
      scope
    end
  end
end
