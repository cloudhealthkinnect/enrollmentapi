class EmailValidator < ActiveModel::EachValidator # :nodoc:
  def validate_each(record, attribute, value)
    return if value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    record.errors[attribute] << (options[:message] || 'This is not a valid email address.')
  end
end
