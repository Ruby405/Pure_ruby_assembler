# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPCOMW
    forms = []
    operands = []
    encodings = []
    # vpcomw: xmm, xmm, xmm, imm8
    operands << OPERAND_TYPES[26]
    operands << OPERAND_TYPES[24]
    operands << OPERAND_TYPES[24]
    operands << OPERAND_TYPES[1]
    encodings << Class.new(Fisk::Encoding) {
      def encode buffer, operands
        add_VEX buffer, operands
        add_opcode buffer, 0xCD, 0
        add_modrm(buffer, operands,
              3,
              operands[0].op_value,
              operands[2].op_value)
        add_immediate buffer, operands[3].op_value, 1
      end

      def bytesize; 3; end
    }.new
    forms << Form.new(operands, encodings)
    operands = []
    encodings = []
    # vpcomw: xmm, xmm, m128, imm8
    operands << OPERAND_TYPES[26]
    operands << OPERAND_TYPES[24]
    operands << OPERAND_TYPES[25]
    operands << OPERAND_TYPES[1]
    encodings << Class.new(Fisk::Encoding) {
      def encode buffer, operands
        add_VEX buffer, operands
        add_opcode buffer, 0xCD, 0
        add_modrm(buffer, operands,
              0,
              operands[0].op_value,
              operands[2].op_value)
        add_immediate buffer, operands[3].op_value, 1
      end

      def bytesize; 3; end
    }.new
    forms << Form.new(operands, encodings)
    VPCOMW = Instruction.new("VPCOMW", forms)
  end
end
