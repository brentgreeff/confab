class Project < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true

  has_many :recorded_changes, class_name: "Change", as: :auditable,
    dependent: :destroy

  before_validation :build_change, on: :update

  private

  def build_change
    self.recorded_changes.build(json: self.changes)
  end
end
