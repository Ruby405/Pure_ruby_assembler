# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPSCATTERQQ
    forms = []
    operands = []
    encodings = []
    # vpscatterqq: vm64x{k}, xmm
    operands << OPERAND_TYPES[106]
    operands << OPERAND_TYPES[24]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_EVEX buffer, operands
        add_opcode buffer, 0xA1, 0
        add_modrm(buffer, operands,
              0,
              operands[1].value,
              operands[0].value)
      end

      def bytesize; 2; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    operands = []
    encodings = []
    # vpscatterqq: vm64y{k}, ymm
    operands << OPERAND_TYPES[107]
    operands << OPERAND_TYPES[60]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_EVEX buffer, operands
        add_opcode buffer, 0xA1, 0
        add_modrm(buffer, operands,
              0,
              operands[1].value,
              operands[0].value)
      end

      def bytesize; 2; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    operands = []
    encodings = []
    # vpscatterqq: vm64z{k}, zmm
    operands << OPERAND_TYPES[108]
    operands << OPERAND_TYPES[63]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_EVEX buffer, operands
        add_opcode buffer, 0xA1, 0
        add_modrm(buffer, operands,
              0,
              operands[1].value,
              operands[0].value)
      end

      def bytesize; 2; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    VPSCATTERQQ = Fisk::Machine::Instruction.new("VPSCATTERQQ", forms)
  end
end
