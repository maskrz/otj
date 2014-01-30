class Ability
  include CanCan::Ability
  
  def initialize(current_user)
    
    if current_user.kind_of? Trainer
      can :manage, :all
    elsif current_user.kind_of? Athlete
      can :read, Athlete do |athlete|
        athlete.privacy <= 2 || (athlete.privacy == 3 && athlete.trainer == current_user.trainer) || athlete == current_user
      end
    else
      can :read, Athlete do |athlete|
        athlete.privacy == 1
      end
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
  # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
