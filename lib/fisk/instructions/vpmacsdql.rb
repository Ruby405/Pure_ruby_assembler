# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPMACSDQL: Packed Multiply Accumulate Signed Low Doubleword to Signed Quadword
    VPMACSDQL = Instruction.new("VPMACSDQL", [
    # vpmacsdql: xmm, xmm, xmm, xmm
      Form.new([
        OPERAND_TYPES[26],
        OPERAND_TYPES[24],
        OPERAND_TYPES[24],
        OPERAND_TYPES[24],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_VEX(buffer, operands)
            add_opcode(buffer, 0x97, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_RegisterByte(buffer, operands)
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vpmacsdql: xmm, xmm, m128, xmm
      Form.new([
        OPERAND_TYPES[26],
        OPERAND_TYPES[24],
        OPERAND_TYPES[25],
        OPERAND_TYPES[24],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_VEX(buffer, operands)
            add_opcode(buffer, 0x97, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_RegisterByte(buffer, operands)
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
