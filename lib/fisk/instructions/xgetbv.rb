# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction XGETBV: Get Value of Extended Control Register
    XGETBV = Instruction.new("XGETBV", [
    # xgetbv: 
      Form.new([
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x01, 0) +
            add_opcode(buffer, 0xD0, 0) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
