# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction SETA: Set byte if above (CF == 0 and ZF == 0)
    SETA = Instruction.new("SETA", [
    # seta: r8
      Form.new([
        OPERAND_TYPES[47],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x97, 0) +
            add_modrm(buffer,
              3,
              0,
              operands[0].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # seta: m8
      Form.new([
        OPERAND_TYPES[43],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x97, 0) +
            add_modrm(buffer,
              0,
              0,
              operands[0].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
