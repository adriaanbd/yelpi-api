# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    @user == @record.registrant
  end

  def update?
    @user == @record.registrant
  end

  def destroy?
    @user == @record.registrant
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end