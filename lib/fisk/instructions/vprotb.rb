# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPROTB
    forms = []
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[24],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0xC0, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # vprotb: xmm, xmm, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[24],
        OPERAND_TYPES[24],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x90, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x90, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[2].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vprotb: xmm, xmm, xmm
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[24],
        OPERAND_TYPES[25],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x90, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[2].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vprotb: xmm, xmm, m128
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[25],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0xC0, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # vprotb: xmm, m128, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[25],
        OPERAND_TYPES[24],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x90, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vprotb: xmm, m128, xmm
    forms << Form.new(operands, encodings)
    VPROTB = Instruction.new("VPROTB", forms)
  end
end
