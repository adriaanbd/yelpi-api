# frozen_string_literal: true

class ObservationPolicy < ApplicationPolicy
  def show?
    @user == @record.registrant
  end

  def create?
    @user != @record.observer
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
