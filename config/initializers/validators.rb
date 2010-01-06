ActiveRecord::Base.class_eval do
  def self.validates_is_url(*attr_names)
    validates_each(attr_names) do |record, attr_name, value|
      unless value.nil?
          begin
            URI.parse(value)
          rescue
            record.errors.add(attr_name, 'must be a valid url')
          end
      end
    end
  end
  
  def self.validates_is_email(*attr_names)
    validates_each(attr_names) do |record, attr_name, value|
      unless value.nil?
        def valid_email?
          TMail::Address.parse(email)
        rescue
          record.errors.add(attr_name, "The email address is invalid")
        end
      end
    end
  end
  
  def self.validates_uniqueness_of_combined(*attr_names)
    options = attr_names.extract_options!.symbolize_keys
    attr_names = attr_names.flatten
    
    send(validation_method(options[:on] || :save), options) do |record|
      sql        = attr_names.map{ |attr_name| "UPPER(#{attr_name}) = ?"}.join(" AND ")
      values     = attr_names.map{ |a| record.send(a) }.map{ |v| v && v.upcase }
      conditions = [sql, *values]

      db_record = record.class.find(:first, :conditions => conditions)
      if db_record && db_record != record
        message = options["message"] || "#{attr_names.map{ |attr_name| record.send attr_name }.join(' ')} has already been added"
        record.errors.add_to_base(message)
      end
    end
  end
end