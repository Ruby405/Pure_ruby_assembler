# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VEXP2PS: Approximation to the Exponential 2^x of Packed Single-Precision Floating-Point Values with Less Than 2^-23 Relative Error
    VEXP2PS = Instruction.new("VEXP2PS", [
    # vexp2ps: zmm{k}{z}, m512/m32bcst
      Form.new([
        OPERAND_TYPES[62],
        OPERAND_TYPES[70],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0xC8, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vexp2ps: zmm{k}{z}, zmm, {sae}
      Form.new([
        OPERAND_TYPES[62],
        OPERAND_TYPES[63],
        OPERAND_TYPES[72],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0xC8, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
