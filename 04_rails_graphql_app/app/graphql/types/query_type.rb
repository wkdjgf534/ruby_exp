# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # get all the users
    field :users, [ Types::UserType ], null: false
    def users
      User.all
    end

    # get a user by id
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
  end
end
