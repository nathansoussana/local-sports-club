class UserPolicy < ApplicationPolicy

def show?
  # Add your authorization logic here
  # For example, check if the current user can view the user's details
  # based on certain conditions or permissions
  true
end
end
