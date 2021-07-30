# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction PREFETCH
    forms = []
    operands = []
    encodings = []
    # prefetch: m8
    operands << OPERAND_TYPES[4]
    encodings << Class.new(Fisk::Encoding) {
      def encode buffer, operands
        add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
        add_opcode(buffer, 0x0F, 0) +
        add_opcode(buffer, 0x0D, 0) +
        add_modrm(buffer,
              0,
              0,
              operands[0].op_value, operands) +
        0
      end
    }.new
    forms << Form.new(operands, encodings)
    PREFETCH = Instruction.new("PREFETCH", forms)
  end
end
