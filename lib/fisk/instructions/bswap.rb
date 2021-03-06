# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction BSWAP: Byte Swap
    BSWAP = Instruction.new("BSWAP", [
    # bswapl: r32
      Form.new([
        OPERAND_TYPES[12],
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
            add_opcode(buffer, 0xC8, operands[0].op_value) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # bswapq: r64
      Form.new([
        OPERAND_TYPES[16],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              true,
              1,
              0,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x0F, 0) +
            add_opcode(buffer, 0xC8, operands[0].op_value) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
