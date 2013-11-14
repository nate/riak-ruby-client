module Riak
  module Crdt
    class Register < String
      attr_reader :parent
      
      def initialize(parent, *args, &block)
        @parent = parent
        super(*args, &block)
        freeze
      end

      def self.update(value)
        Operation::Update.new.tap do |op|
          op.value = value
          op.type = :register
        end
      end
    end
  end
end
