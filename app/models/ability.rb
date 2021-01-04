# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    return can :manage, :all if user.admin?

    alias_action :create, :read, :update, :destroy, to: :crud

    if user.field?
      can :manage, User, id: user.id
      can %i[index create read], FieldForm, user_id: user.id
      can :update, FieldForm, user_id: user.id, status: :pending
    end

    if user.lab?
      can :manage, User, id: user.id
      can %i[index read], [Faq, Institutional]
      can %i[index read update], FieldForm, user: { departament_id: user.departament_id }, status: :pending
    end

    if user.supervisor?
      can :manage, User, id: user.id
      can %i[index read], [Faq, Institutional]
      can %i[index read], FieldForm, user: { departament_id: user.departament_id }
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
