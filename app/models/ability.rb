class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id

    return if user.role != 'admin'

    can :manage, :all
  end
end
