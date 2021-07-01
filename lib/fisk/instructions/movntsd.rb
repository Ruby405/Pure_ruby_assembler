# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction MOVNTSD
    forms = []
    operands = []
    encodings = []
    # movntsd: m64, xmm
    operands << OPERAND_TYPES[44]
    operands << OPERAND_TYPES[24]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_prefix buffer, operands, 0xF2, true
        add_rex(buffer, operands,
              false,
              0,
              (operands[1].value >> 3),
              (operands[0].value >> 3),
              (operands[0].value >> 3))
        add_opcode buffer, 0x0F, 0
        add_opcode buffer, 0x2B, 0
        add_modrm(buffer, operands,
              0,
              operands[1].value,
              operands[0].value)
      end

      def bytesize; 3; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    MOVNTSD = Fisk::Machine::Instruction.new("MOVNTSD", forms)
  end
end
