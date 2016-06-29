class Module
  def create_counter_methods(*attributes)
    attributes.each do |type|
      my_count_method = %Q{
        def count_by_#{type}(filter_value)
          object.#{type}.to_s.each_with_object(Hash.new(0)) do |object, total|
            total[object.#{type}] += 1
          # objects = self.all
          # objects.each {|object| return object if object.#{type}.to_s == filter_value}
        end
      }
      self.instance_eval(my_count_method)
    end
  end

  def create_reporting_methods(*attributes)
    report = "Inventory by #{type}: \n"
    my_report_method = %Q{
      object.count_by#{type}(attributes).each do |#{type}, total|
        report << " - #{type}: #{total}\n"
      end
    }
    self.instance_eval(my_report_method)
  end 
  
  def method_missing(method_name, *arguments)
    super unless method_name.to_s.start_with?("count_by")  
    create_finder_methods(method_name.to_s[9..-1]) #do not include "
    send(method_name, *arguments)
  end
end