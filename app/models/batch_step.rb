class BatchStep < ApplicationRecord
  belongs_to :resource
  belongs_to :batch
end
