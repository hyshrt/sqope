class Program < ApplicationRecord
  belongs_to :funder
  has_many :program_fields, dependent: :destroy
  has_many :program_areas, dependent: :destroy
  has_many :program_targets, dependent: :destroy
  has_many :view_histories, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :fields, through: :program_fields
  has_many :areas, through: :program_areas
  has_many :targets, through: :program_targets
  has_many :users, through: :view_histories
  has_many :users, through: :interests

  validates :funder_id, :program_name, :start_datetime, :end_datetime, :grant_amount, :overview, :determining_time, :implementation_period, :payment_method, :selection_method, :use, :self_pay, :message ,presence: true
  mount_uploader :program_logo, ProgramlogoUploader

  def interested?(user)
    interests.where(user_id: user.id).exists?
  end
  def self.search(name, area_ids, target_ids, field_ids)
    if name != ""
      funder_name_search = Funder.where("name LIKE ?", "%#{name}%")
      funder_id = funder_name_search.pluck(:id)
      Program.where(funder_id: funder_id)
    else
      nested_program = Program.joins(:areas, :targets, :fields)
      nested_program = nested_program.where(areas: { id: area_ids }) if area_ids.present?
      nested_program = nested_program.where(targets: { id: target_ids }) if target_ids.present?
      nested_program = nested_program.where(fields: { id: field_ids }) if field_ids.present?
      program_id = nested_program.pluck(:id)
      Program.where(id: program_id)
    end
  end

  scope :release_opened, -> { where(release_and_status: 1) }
    
  scope :start_datetime_past, -> { where(start_datetime: 1.week.ago.all_day) }
  scope :end_datetime_week_since, -> { where(end_datetime: 1.week.since.all_day) }
  scope :end_datetime_past, -> { where(end_datetime: 1.day.ago.all_day) }
end
