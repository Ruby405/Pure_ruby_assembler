# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction PFNACC: Packed Floating-Point Negative Accumulate
    PFNACC = Instruction.new("PFNACC", [
    # pfnacc: mm, mm
      Form.new([
        OPERAND_TYPES[54],
        OPERAND_TYPES[36],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x0F, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            add_opcode(buffer, 0x8A, 0) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # pfnacc: mm, m64
      Form.new([
        OPERAND_TYPES[54],
        OPERAND_TYPES[18],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x0F, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            add_opcode(buffer, 0x8A, 0) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
