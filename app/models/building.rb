class Building < ApplicationRecord
  scope :registered, -> { where(register_status: true) }
  scope :unregistered, -> { where(register_status: false) }
end
