class Project < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true

  has_many :recorded_changes, class_name: "Change", as: :auditable,
    dependent: :destroy

  attr_accessor :updated_by
  validates :updated_by, presence: true, on: :update

  after_validation :build_change, on: :update

  private

  def build_change
    self.recorded_changes.build(json: self.changes, author: updated_by)
  end
end
