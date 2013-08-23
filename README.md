# ElementHelper

Gem is a wrapper around Capybara.
It provides users with a method that can does a lot of element related operations like check the presence of an element on page, get value of the element, get the attribute value, find multiple elements with same selector, find all their values, etc.

## Installation

Add this line to your application's Gemfile:

    gem 'intelement'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install intelement

## Usage

# Require ElementHelper in your file
    $ require 'intelement'

# To visit the page, specify the URL
    $ ElementHelper.visit_page("http://www.flipkart.com/")
  Driver to be used can also be specified. By default it is selenium.
    $ ElementHelper.visit_page("http://www.flipkart.com/", :selenium)

# To check whether an element for a given CSS selector or XPath is present (returns a boolean)
    $ ElementHelper.get_element_details(".btn.btn-blue.btn-cart")
    $ ElementHelper.get_element_details("//div[@class='btn btn-blue btn-cart']")

# To get the value of a particular element, we need to specify the type of element
    $ ElementHelper.get_element_details(".fk-cstext", :text)
  The options supported for this are :text, :link and :button. (:text and :link do .text after finding the element while :button does a .value)

# When multiple elements are obtained using a specified selector, to get the value of an element at a particular index
    $ ElementHelper.get_element_details("//a[@href='/']", :text, 1)

# When attribute value of a particular element is to be found
    $ ElementHelper.get_element_details("//a[@href='/s/help']", "class")
    Above, "class" is the attribute whoes value we require

# When multiple elements are obtained using a specified selector, to get the attribute value of an element at a particular index
    $ ElementHelper.get_element_details("//a[@class='fk-footer-unit fk-footer-link']", "href", 0)

# When multiple elements are obtained using a specified selector, to get the values of all element
    $ ElementHelper.get_element_details("//a[@class='fk-footer-unit fk-footer-link']", :text, :all)

# When multiple elements are obtained using a specified selector, to get the attribute values of all element
    $ ElementHelper.get_element_details("//a[@class='fk-footer-unit fk-footer-link']", "href", :all)

# To get the number of elements with the specified Xpath or CSS selector
    $ ElementHelper.get_element_details("//a[@href='/']", nil, :all)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
