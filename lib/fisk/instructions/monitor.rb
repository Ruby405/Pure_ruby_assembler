# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction MONITOR: Monitor a Linear Address Range
    MONITOR = Instruction.new("MONITOR", [
    # monitor: 
      Form.new([
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x01, 0) +
            add_opcode(buffer, 0xC8, 0) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
