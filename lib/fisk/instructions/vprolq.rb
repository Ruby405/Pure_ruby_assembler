# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPROLQ: Rotate Packed Quadword Left
    VPROLQ = Instruction.new("VPROLQ", [
    # vprolq: xmm{k}{z}, m128/m64bcst, imm8
      Form.new([
        OPERAND_TYPES[57],
        OPERAND_TYPES[58],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x72, 0) +
            add_modrm(buffer,
              0,
              1,
              operands[1].op_value, operands) +
            add_immediate(buffer, operands[2].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vprolq: ymm{k}{z}, m256/m64bcst, imm8
      Form.new([
        OPERAND_TYPES[59],
        OPERAND_TYPES[61],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x72, 0) +
            add_modrm(buffer,
              0,
              1,
              operands[1].op_value, operands) +
            add_immediate(buffer, operands[2].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vprolq: zmm{k}{z}, m512/m64bcst, imm8
      Form.new([
        OPERAND_TYPES[62],
        OPERAND_TYPES[64],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x72, 0) +
            add_modrm(buffer,
              0,
              1,
              operands[1].op_value, operands) +
            add_immediate(buffer, operands[2].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vprolq: xmm{k}{z}, xmm, imm8
      Form.new([
        OPERAND_TYPES[57],
        OPERAND_TYPES[24],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x72, 0) +
            add_modrm(buffer,
              3,
              1,
              operands[1].op_value, operands) +
            add_immediate(buffer, operands[2].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vprolq: ymm{k}{z}, ymm, imm8
      Form.new([
        OPERAND_TYPES[59],
        OPERAND_TYPES[60],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x72, 0) +
            add_modrm(buffer,
              3,
              1,
              operands[1].op_value, operands) +
            add_immediate(buffer, operands[2].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vprolq: zmm{k}{z}, zmm, imm8
      Form.new([
        OPERAND_TYPES[62],
        OPERAND_TYPES[63],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x72, 0) +
            add_modrm(buffer,
              3,
              1,
              operands[1].op_value, operands) +
            add_immediate(buffer, operands[2].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
