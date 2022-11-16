# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, User
    return unless user.present?
    can :read, User
    can :manage, User, id: user.id
    can :read, Group
    can :create, Group
    can :manage, Group, Group.joins(:memberships).where("memberships.user_id = ?", user.id) do |group|
      group.members.include?(user)
    end
    can :read, Receipt
    can :manage, Receipt, user_id: user.id
  end
end
