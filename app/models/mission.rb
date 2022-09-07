class Mission < ApplicationRecord

  # validates :name, presence: true
  # validates :scientist_id, presence: true, uniqueness: true
  # validates :planet_id, presence: true

  validates :name, :scientist_id, :planet, presence: true
  validates :scientist, uniqueness: { scope: :name }

  # validates :name, :scientist, :planet, presence: true
  # validates :name, uniqueness: { scope: :scientist_id }

  
  belongs_to :scientist
  belongs_to :planet

end
