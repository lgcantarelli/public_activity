require 'mongoid'

module PublicActivity
  module ORM
    module Mongoid
      # The ActiveRecord model containing
      # details about recorded activity.
      class Activity
        include ::Mongoid::Document
        include ::Mongoid::Timestamps
        include ::Mongoid::Attributes::Dynamic
        include Renderable

        field :key,         type: String
        field :parameters,  type: Hash

        def user
          User.find_by(id: self.user_id) if self.user_id
        end

        def trackable
          self.trackable_type.constantize.find_by(id: self.trackable_id)
        end
      end
    end
  end
end
