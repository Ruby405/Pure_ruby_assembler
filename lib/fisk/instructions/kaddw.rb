# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction KADDW
    forms = []
    operands = [
        OPERAND_TYPES[41],
        OPERAND_TYPES[42],
        OPERAND_TYPES[42],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x4A, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[2].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # kaddw: k, k, k
    forms << Form.new(operands, encodings)
    KADDW = Instruction.new("KADDW", forms)
  end
end
