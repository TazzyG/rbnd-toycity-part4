class Module

  def create_count_methods(field)
    [:brand, :name].each do |field|
      send(:define_method, "count_by_#{field}") do |products|
        sums = Hash.new(0)
        products.each do |product|
          value = product.send(field)
          sums[value] += 1
        end
        sums
      end
    end
  end

  def method_missing(method_name, *arguments)
    super unless method_name.to_s.start_with?("count_by")  
    create_counter_methods(method_name.to_s[9..-1])
    send(method_name, *arguments)
  end

  def respond_to_missing(method_name)
    method_name[-1] == '?'
  end

end