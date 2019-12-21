# frozen_string_literal: true

class VitalPolicy < ApplicationPolicy
  def show?
    @user == @record.registrant
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
