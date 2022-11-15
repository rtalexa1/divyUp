# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :manage, User, id: user.id
    can :manage, Group  #, Group.joins(:memberships).where("memberships.user_id = ?", user.id) do |group|
      # group.members.include?(user)
    # end
    can :manage, Receipt, user_id: user.id
  end
end
