class Menu

  def initialize(options)
    @options = options
    @choices = {}
    @options.each do |option, data|
      translation = { data[:text] => option }
      @choices.merge!(translation)
    end
  end

  def run(option)
    if @options.keys.include?(option)
      action = @options[option][:action]
      if action.is_a?(Proc) || action.is_a?(Method)
        action.call
      elsif action.is_a?(Menu)
        action.prompt
      else
        action
      end
    else
      :invalid_option
    end

  end

  def options
    @options
  end

  def add(option)
    @options.merge!(option)
    option.each do |option, data|
      translation = { data[:text] => option }
      @choices.merge!(translation)
    end
  end

  def translate_string(input)
    @choices[input]
  end


  def prompt
    option = translate_string(STDIN.gets.chomp)
    run(option)
  end

end