class ExecutedStep < ApplicationRecord
  belongs_to :user
  belongs_to :batch
  belongs_to :process_step
end
