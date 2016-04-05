class DoomLog < ApplicationRecord
  after_create_commit { DoomLogBroadcastJob.perform_later self }
end
