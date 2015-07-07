class Translation < ActiveRecord::Base
  belongs_to :translatable, polymorphic: true

  scope :field, -> (field) { where(translatable_field: field) }
  scope :ordered, -> { order(locale: :asc) }
  scope :locale, -> (locale) { where(locale: locale) }
end
