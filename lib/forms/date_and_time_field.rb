module Forms::DateAndTimeField
  extend ActiveSupport::Concern

  included do
    def self.date_and_time_field(name, options={})
      options.reverse_merge! validates: false

      date_attr = "#{name}_date"
      time_attr = "#{name}_time"

      attribute date_attr, type: String
      attribute time_attr, type: String

      if validations = options[:validates]
        # For some reason ActiveModel barfs when using the same hash for multiple
        # validations. Dup to avoid that.
        validates date_attr, validations.dup
        validates time_attr, validations.dup
      end

      define_method "#{name}=" do |time|
        send("#{date_attr}=", time.try(:strftime, "%m/%d/%Y"))
        send("#{time_attr}=", time.try(:strftime, "%-I:%M%P"))
      end

      define_method "#{name}" do
        Chronic.parse(send(date_attr) + " " + send(time_attr))
      end
    end
  end
end
