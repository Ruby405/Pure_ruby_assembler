# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPBLENDVB
    forms = []
    operands = []
    encodings = []
    # vpblendvb: xmm, xmm, xmm, xmm
    operands << OPERAND_TYPES[26]
    operands << OPERAND_TYPES[24]
    operands << OPERAND_TYPES[24]
    operands << OPERAND_TYPES[24]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_VEX buffer, operands
        add_opcode buffer, 0x4C, 0
        add_modrm(buffer, operands,
              3,
              operands[0].value,
              operands[2].value)
        add_RegisterByte buffer, operands
      end

      def bytesize; 2; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    operands = []
    encodings = []
    # vpblendvb: xmm, xmm, m128, xmm
    operands << OPERAND_TYPES[26]
    operands << OPERAND_TYPES[24]
    operands << OPERAND_TYPES[25]
    operands << OPERAND_TYPES[24]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_VEX buffer, operands
        add_opcode buffer, 0x4C, 0
        add_modrm(buffer, operands,
              0,
              operands[0].value,
              operands[2].value)
        add_RegisterByte buffer, operands
      end

      def bytesize; 2; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    operands = []
    encodings = []
    # vpblendvb: ymm, ymm, ymm, ymm
    operands << OPERAND_TYPES[65]
    operands << OPERAND_TYPES[60]
    operands << OPERAND_TYPES[60]
    operands << OPERAND_TYPES[60]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_VEX buffer, operands
        add_opcode buffer, 0x4C, 0
        add_modrm(buffer, operands,
              3,
              operands[0].value,
              operands[2].value)
        add_RegisterByte buffer, operands
      end

      def bytesize; 2; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    operands = []
    encodings = []
    # vpblendvb: ymm, ymm, m256, ymm
    operands << OPERAND_TYPES[65]
    operands << OPERAND_TYPES[60]
    operands << OPERAND_TYPES[66]
    operands << OPERAND_TYPES[60]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_VEX buffer, operands
        add_opcode buffer, 0x4C, 0
        add_modrm(buffer, operands,
              0,
              operands[0].value,
              operands[2].value)
        add_RegisterByte buffer, operands
      end

      def bytesize; 2; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    VPBLENDVB = Fisk::Machine::Instruction.new("VPBLENDVB", forms)
  end
end