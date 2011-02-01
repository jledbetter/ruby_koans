require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutTrueAndFalse < EdgeCase::Koan
  def truth_value(condition)
    if condition
      :true_stuff
    else
      :false_stuff
    end
  end

  def test_true_is_treated_as_true
    assert_equal :true_stuff, truth_value(true)    
  end

  def test_false_is_treated_as_false
    assert_equal :false_stuff, truth_value(false)
  end

  def test_nil_is_treated_as_false_too
    assert_equal :false_stuff, truth_value(nil) #POINT: nil is 0 is my thinking here so false
  end

  def test_everything_else_is_treated_as_true
    assert_equal :true_stuff, truth_value(1)
    assert_equal :true_stuff, truth_value(0) #Question: thought this would be false since 0 but it's :true_stuff
    assert_equal :true_stuff, truth_value([]) #Question: thought false
    assert_equal :true_stuff, truth_value({})  #Question: thought false
    assert_equal :true_stuff, truth_value("Strings") #Question: thought false
    assert_equal :true_stuff, truth_value("") #Question: thought false
  end

end
