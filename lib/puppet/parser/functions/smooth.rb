# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2

module Puppet::Parser::Functions
  newfunction(:smooth, :type => :rvalue) do |args|
    raise(Puppet::ParseError, "smooth(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size != 1

    result = {}

    flatten = Proc.new do |hash, old_path|
      hash.each do |key, value|
        current_path = old_path + [key]

        if !value.respond_to?(:keys)
          result[current_path.join(".")] = value
        else
          flatten.call(value, current_path)
        end
      end

      result
    end

    arg = args[0]

    unless arg.is_a?(Hash)
      raise Puppet::ParseError, "smooth: unexpected argument type #{arg.class}, only expects hash arguments"
    end

    flatten.call(arg, [])
  end
end
