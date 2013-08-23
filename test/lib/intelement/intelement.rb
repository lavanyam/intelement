require_relative '../../test_helper'

describe Intelement, "When the presence of an element on a page is requested by using a css selector" do
  it "should return true when the element is present" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.is_element_present?(".btn.btn-blue.btn-cart").must_equal true
  end

  it "should return false when the element is not present" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.is_element_present?("#invalid_element_css_selector").must_equal false
  end
end

describe Intelement, "When the presence of an element on a page is requested by using an xpath selector" do
  it "should return true when the element is present" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.is_element_present?("//div[@class='btn btn-blue btn-cart']").must_equal true
  end

  it "should return false when the element is not present" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.is_element_present?("//div[@class='invalid_element_xpath_selector']").must_equal false
  end
end

describe Intelement, "When the value of a single element is requested for" do
  it "should return the appropriate value" do
    Intelement.visit_page("http://www.dell.com/")
    Intelement.get_element_value("//button[@type='submit']").must_equal "Search"
  end

  it "should return the appropriate value" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_element_value(".fk-cstext", :text).must_equal "24x7 Customer Support"
  end

  it "should return the appropriate value" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_element_value("//a[@href='/s/help']", :link).must_equal "FAQ"
  end

  it "should return the appropriate value" do
    Intelement.visit_page("http://www.w3schools.com/html/html_forms.asp")
    Intelement.get_element_value("//input[@type='submit']", :button).must_equal "Submit"
  end
end

describe Intelement, "When all the matches for elements with a particular selector is requested for" do
  it "should give an array of all the matches" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_all_elements("//a[@href='/']").size.must_equal 2
  end
end

describe Intelement, "When we need an elements value with a particular selector that returns multiple candidates" do
  it "should give us the value of the element we requested for" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_element_value_of_index("//a[@href='/']", :text, 1).must_equal "Home"
  end
end


describe Intelement, "When we need to get the attribute value of an element" do
  it "should give us the requested attribute value" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_attribute_value("//a[@href='/s/help']", "class").must_equal "fk-footer-unit fk-footer-link"
  end
end

describe Intelement, "When we need to get the attribute value of an element from multiple candidates" do
  it "should give us the requested attribute value for the requested element" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_attribute_value_of_index("//a[@class='fk-footer-unit fk-footer-link']", "href", 0).must_equal "http://www.flipkart.com/s/help/payments"
  end
end

describe Intelement, "When requested for all the values" do
  it "should give a map of all the values" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_all_elements_value("//a[@class='fk-footer-unit fk-footer-link']", :text).must_equal ["Payments", "Saved Cards", "Shipping", "Cancellation & Returns", "FAQ", "Contact Us", "About Us", "Careers", "Blog", "Press", "Slash N", "Download Manager", "MP3 FAQ", "MP3 App", "eBooks FAQ", "eBooks App", "Online Shopping", "Affiliate", "Wallet", "e-Gift Voucher", "Flipkart lite", "Store Directory"]
  end
end

describe Intelement, "When requested for all the values of attributes" do
  it "should give a map of all the attribute values" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_all_element_attribute_value("//a[@class='fk-footer-unit fk-footer-link']", "href").must_equal ["http://www.flipkart.com/s/help/payments", "http://www.flipkart.com/help/savedcard_how", "http://www.flipkart.com/s/help/shipping", "http://www.flipkart.com/s/help/cancellation-returns", "http://www.flipkart.com/s/help", "http://www.flipkart.com/s/contact", "http://www.flipkart.com/about-us", "http://www.flipkart.com/s/careers", "http://www.flipkart.com/ol?link=http%3A%2F%2Fblog.flipkart.com%2F", "http://www.flipkart.com/s/press", "http://slashn.flipkart.net/", "http://www.flipkart.com/help/downloadmanager", "http://www.flipkart.com/s/mp3help", "http://www.flipkart.com/help/flytemp3app", "http://www.flipkart.com/help/flyteeBookfaq", "http://www.flipkart.com/ebooks/apps", "http://www.flipkart.com/", "http://www.flipkart.com/affiliate/", "http://www.flipkart.com/help/wallet", "http://www.flipkart.com/buy-gift-voucher", "http://www.flipkart.com/m?sitevariant=mobile", "http://www.flipkart.com/store-directory"]
  end
end


describe Intelement, "When we need a single method to get the value or attribute or presence of an element" do
  it "should give us the correct result" do
    Intelement.visit_page("http://www.flipkart.com/")
    Intelement.get_element_details(".btn.btn-blue.btn-cart").must_equal true
    Intelement.get_element_details(".fk-cstext", :text).must_equal "24x7 Customer Support"
    Intelement.get_element_details("//a[@href='/']", :text, 1).must_equal "Home"
    Intelement.get_element_details("//a[@href='/s/help']", "class").must_equal "fk-footer-unit fk-footer-link"
    Intelement.get_element_details("//a[@class='fk-footer-unit fk-footer-link']", "href", 0).must_equal "http://www.flipkart.com/s/help/payments" # get particular element attribute
    Intelement.get_element_details("//a[@class='fk-footer-unit fk-footer-link']", :text, :all).must_equal ["Payments", "Saved Cards", "Shipping", "Cancellation & Returns", "FAQ", "Contact Us", "About Us", "Careers", "Blog", "Press", "Slash N", "Download Manager", "MP3 FAQ", "MP3 App", "eBooks FAQ", "eBooks App", "Online Shopping", "Affiliate", "Wallet", "e-Gift Voucher", "Flipkart lite", "Store Directory"]
    Intelement.get_element_details("//a[@class='fk-footer-unit fk-footer-link']", "href", :all).must_equal ["http://www.flipkart.com/s/help/payments", "http://www.flipkart.com/help/savedcard_how", "http://www.flipkart.com/s/help/shipping", "http://www.flipkart.com/s/help/cancellation-returns", "http://www.flipkart.com/s/help", "http://www.flipkart.com/s/contact", "http://www.flipkart.com/about-us", "http://www.flipkart.com/s/careers", "http://www.flipkart.com/ol?link=http%3A%2F%2Fblog.flipkart.com%2F", "http://www.flipkart.com/s/press", "http://slashn.flipkart.net/", "http://www.flipkart.com/help/downloadmanager", "http://www.flipkart.com/s/mp3help", "http://www.flipkart.com/help/flytemp3app", "http://www.flipkart.com/help/flyteeBookfaq", "http://www.flipkart.com/ebooks/apps", "http://www.flipkart.com/", "http://www.flipkart.com/affiliate/", "http://www.flipkart.com/help/wallet", "http://www.flipkart.com/buy-gift-voucher", "http://www.flipkart.com/m?sitevariant=mobile", "http://www.flipkart.com/store-directory"]
    Intelement.get_element_details("//a[@href='/']", nil, :all).size.must_equal 2
  end
end
