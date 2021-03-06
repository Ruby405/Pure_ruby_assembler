# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction PSLLDQ: Shift Packed Double Quadword Left Logical
    PSLLDQ = Instruction.new("PSLLDQ", [
    # pslldq: xmm, imm8
      Form.new([
        OPERAND_TYPES[23],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, true) +
            add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x73, 0) +
            add_modrm(buffer,
              3,
              7,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
