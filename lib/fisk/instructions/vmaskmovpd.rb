# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VMASKMOVPD
    forms = []
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[24],
        OPERAND_TYPES[25],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x2D, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[2].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vmaskmovpd: xmm, xmm, m128
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[65],
        OPERAND_TYPES[60],
        OPERAND_TYPES[66],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x2D, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[2].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vmaskmovpd: ymm, ymm, m256
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[53],
        OPERAND_TYPES[24],
        OPERAND_TYPES[24],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x2F, 0) +
          add_modrm(buffer,
              0,
              operands[2].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vmaskmovpd: m128, xmm, xmm
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[95],
        OPERAND_TYPES[60],
        OPERAND_TYPES[60],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x2F, 0) +
          add_modrm(buffer,
              0,
              operands[2].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vmaskmovpd: m256, ymm, ymm
    forms << Form.new(operands, encodings)
    VMASKMOVPD = Instruction.new("VMASKMOVPD", forms)
  end
end
