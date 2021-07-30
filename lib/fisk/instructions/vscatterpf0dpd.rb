# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VSCATTERPF0DPD
    forms = []
    operands = [
        OPERAND_TYPES[89],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0xC6, 0) +
          add_modrm(buffer,
              0,
              5,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vscatterpf0dpd: vm32y{k}
    forms << Form.new(operands, encodings)
    VSCATTERPF0DPD = Instruction.new("VSCATTERPF0DPD", forms)
  end
end
