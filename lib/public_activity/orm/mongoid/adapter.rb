module PublicActivity
  module ORM
    module Mongoid
      class Adapter
        # Creates the activity without trackable association to prevent multiple-orm crash

        def self.create_activity(trackable, options)
          options.merge!(trackable_type: trackable.class.to_s, trackable_id: trackable.id)
          PublicActivity::Activity.create(options)
        end
      end
    end
  end
end
