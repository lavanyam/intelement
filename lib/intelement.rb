require_relative 'intelement/version'
require 'capybara'

module Intelement

  class << self
    include Capybara::DSL
    attr_reader :uri, :driver

    def visit_page uri=nil, driver=:selenium
      @uri = uri
      @driver = driver
      Capybara.default_driver = @driver
      Capybara.visit uri
    end

    def is_element_present? locator
      selector = get_selector locator
      has_selector?(selector, locator)
    end

    def get_element_value locator, type=:text
      selector = get_selector locator
      case type
        when :text, :link
          find(selector, locator).text
        when :button
          find(selector, locator).value
      end
    end

    def get_all_elements locator
      selector = get_selector locator
      all(selector, locator)
    end

    def get_element_value_of_index locator, type=:text, index=0
      selector = get_selector locator
      case type
        when :text, :link
          all(selector, locator)[index].text
        when :button
          all(selector, locator)[index].value
      end
    end

    def get_attribute_value locator, attribute_name
      selector = get_selector locator
      find(selector, locator)[attribute_name]
    end

    def get_attribute_value_of_index locator, attribute_name, index=0
      selector = get_selector locator
      all(selector, locator)[index][attribute_name]
    end

    def get_all_elements_value locator, type=:text
      selector = get_selector locator
      all_elements = all(selector, locator)
      element_values = case type
                         when :text, :link
                           all_elements.map do |element|
                             element.text
                           end
                         when :button
                           all_elements.map do |element|
                             element.value
                           end
                       end
      element_values
    end

    def get_all_element_attribute_value locator, attribute_name
      selector = get_selector locator
      all_elements = all(selector, locator)
      attribute_values = all_elements.map do |element|
        element[attribute_name]
      end
      attribute_values
    end

    def get_element_details locator, value_to_get=nil, index=nil
      if value_to_get.nil? && index.nil?
        is_element_present? locator
      elsif value_to_get.nil? && index.eql?(:all)
        get_all_elements locator
      elsif index.nil?
        if value_to_get.class.eql?(String)
          get_attribute_value locator, value_to_get
        else
          get_element_value locator, value_to_get
        end
      else
        if index.class.eql?(Symbol)
          if value_to_get.class.eql?(String)
            get_all_element_attribute_value locator, value_to_get
          else
            get_all_elements_value locator, value_to_get
          end
        else
          if value_to_get.class.eql?(String)
            get_attribute_value_of_index locator, value_to_get, index
          else
            get_element_value_of_index locator, value_to_get, index
          end
        end
      end
    end

    def get_selector locator
      locator[0] == '/' ? :xpath : :css
    end

  end
end

