module ActsAsTranslatable
  module ClassMethods
    def acts_as_translatable_on(*fields)
      scope :with_translations, -> (locale) { includes(:translations).where(translations: {locale: locale}) }
      has_many :translations, as: :translatable, dependent: :destroy

      # loop through fields to define methods such as "name" and "description"
      fields.each do |field|
        define_method "#{field}" do |original=nil|
          original == :original ? super() : locale_translations[field]
        end

        define_method "#{field}?" do
          !send("#{field}").blank?
        end
      end

      define_method :locale_translations do
        # load translations
        unless @locale_translations
          @locale_translations = {}
          self.translations.each do |translation|
            @locale_translations ||= {}
            @locale_translations[translation.translatable_field.to_sym] = translation.content
          end
        end
        @locale_translations
      end

    end

  end
end