# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction MOVNTPD: Store Packed Double-Precision Floating-Point Values Using Non-Temporal Hint
    MOVNTPD = Instruction.new("MOVNTPD", [
    # movntpd: m128, xmm
      Form.new([
        OPERAND_TYPES[53],
        OPERAND_TYPES[24],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, true) +
            add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0x2B, 0) +
            add_modrm(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
