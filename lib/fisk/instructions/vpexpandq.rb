# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPEXPANDQ
    forms = []
    operands = [
        OPERAND_TYPES[57],
        OPERAND_TYPES[24],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x89, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpexpandq: xmm{k}{z}, xmm
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[59],
        OPERAND_TYPES[60],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x89, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpexpandq: ymm{k}{z}, ymm
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[62],
        OPERAND_TYPES[63],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x89, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpexpandq: zmm{k}{z}, zmm
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[57],
        OPERAND_TYPES[25],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x89, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpexpandq: xmm{k}{z}, m128
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[59],
        OPERAND_TYPES[66],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x89, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpexpandq: ymm{k}{z}, m256
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[62],
        OPERAND_TYPES[78],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x89, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpexpandq: zmm{k}{z}, m512
    forms << Form.new(operands, encodings)
    VPEXPANDQ = Instruction.new("VPEXPANDQ", forms)
  end
end
