# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction CVTTPS2DQ
    forms = []
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[24],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0xF3, true) +
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0x5B, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cvttps2dq: xmm, xmm
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[25],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0xF3, true) +
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0x5B, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cvttps2dq: xmm, m128
    forms << Form.new(operands, encodings)
    CVTTPS2DQ = Instruction.new("CVTTPS2DQ", forms)
  end
end
