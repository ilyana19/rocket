require "minitest/autorun"
require 'minitest/pride'
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!
  def setup
    @rocket = Rocket.new
    @mox = Rocket.new(name: 'M.O.X', colour: 'orange', flying: true)
    @aries = Rocket.new(name: 'Aries III', colour: 'blue')
  end

  def test_rocket_initialize_with_default_name
    assert_instance_of(String, @rocket.name)
  end

  def test_rocket_initialize_with_default_colour
    assert_instance_of(String, @rocket.colour)
  end

  def test_rocket_initialize_with_default_flying
    assert_equal(false, @rocket.flying?)
  end

  def test_rocket_initialize_with_given_name
    assert_equal('M.O.X', @mox.name)
  end

  def test_rocket_initialize_with_given_colour
    assert_equal('orange', @mox.colour)
  end

  def test_rocket_initialize_with_given_flying
    assert_equal(true, @mox.flying?)
  end

  def test_rocket_is_ready_to_lift_off
    assert_equal(true, @rocket.lift_off)
  end

  def test_rocket_has_already_lift_off
    assert_equal(false, @mox.lift_off)
  end

  def test_rocket_is_ready_to_land
    assert_equal(true, @mox.land)
  end

  def test_rocket_is_already_on_land
    assert_equal(false, @rocket.land)
  end

  def test_rocket_status_with_flying_is_true
    expected_result = 'Rocket M.O.X is flying through the sky!'
    assert_equal(expected_result, @mox.status)
  end

  def test_rocket_status_with_flying_is_false
    expected_result = 'Rocket Aries III is ready for lift off!'
    assert_equal(expected_result, @aries.status)
  end
end
