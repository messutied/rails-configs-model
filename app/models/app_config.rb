class AppConfig < ActiveRecord::Base
  attr_accessible :cdata_type, :name, :value

  def self.get(name)
    config = find_by_name(name)

    if config
      case config.cdata_type
      when "f"
        return config.value.to_f
      when "i"
        return config.value.to_i
      when "b"
        return config.value.to_bool
      else
        return config.value
      end
    end
  end

  def self.set(name, value)
    type = "s"
    nvalue = value

    case
    when value.class == Float
      type = "f"
    when value.class == Fixnum
      type = "i"
    when value.class == TrueClass
      type = "b"
      nvalue = "true"
    when value.class == FalseClass
      type = "b"
      nvalue = "false"
    end
      

    config = find_by_name(name)
    if config.nil?
      create(:cdata_type => type, :name => name, :value => nvalue)
    else
      config.value = nvalue
      config.cdata_type = type
      config.save
    end
  end
end
