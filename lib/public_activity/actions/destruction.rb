module PublicActivity
  # Handles creation of Activities upon destruction of tracked model.
  module Destruction
    extend ActiveSupport::Concern

    included do
      after_commit :activity_on_destroy, on: :destroy
    end

    private

    # Records an activity upon destruction of the tracked model
    def activity_on_destroy
      create_activity(:destroy)
    end
  end
end
