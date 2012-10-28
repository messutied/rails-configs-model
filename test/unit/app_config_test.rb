require 'test_helper'

class AppConfigTest < ActiveSupport::TestCase
  test "data type integer" do
    integer_setting = AppConfig.get(:config_integer)
    assert integer_setting.class == Fixnum, "Class: #{integer_setting.class}"
  end

  test "should create boolean config and get it as boolean" do
    AppConfig.set(:boolean_config, true)
    config = AppConfig.get(:boolean_config)
    assert config == true, "Stored #{config.inspect}"
  end

  test "should create integer config and get it as integer" do
    AppConfig.set(:integer_config, 5)
    config = AppConfig.get(:integer_config)
    assert config == 5, "Stored #{config.inspect}"
  end

  test "should create float config and get it as float" do
    AppConfig.set(:float_config, 5.5)
    config = AppConfig.get(:float_config)
    assert config == 5.5, "Stored #{config.inspect}"
  end

  test "should create string config and get it as string" do
    AppConfig.set(:string_config, "str")
    config = AppConfig.get(:string_config)
    assert config == "str", "Stored #{config.inspect}"
  end

  test "should update and not re-create string config and get it as string" do
    AppConfig.set(:string_config, "str")
    AppConfig.set(:string_config, "str UPDATED")
    assert AppConfig.find_all_by_name("string_config").count == 1, "have created instead of updating a config"

    config = AppConfig.get(:string_config)
    assert config == "str UPDATED", "Stored #{config.inspect}"
  end
end
