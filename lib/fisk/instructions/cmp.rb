# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction CMP
    forms = []
    operands = [
        OPERAND_TYPES[31],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_opcode(buffer, 0x3C, 0) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpb: al, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[3],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x80, 0) +
          add_modrm(buffer,
              3,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpb: r8, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[3],
        OPERAND_TYPES[3],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x38, 0) +
          add_modrm_reg_reg(buffer,
              3,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
          add_opcode(buffer, 0x3A, 0) +
          add_modrm_reg_reg(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpb: r8, r8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[3],
        OPERAND_TYPES[4],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
          add_opcode(buffer, 0x3A, 0) +
          add_modrm_reg_mem(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpb: r8, m8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[32],
        OPERAND_TYPES[6],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_opcode(buffer, 0x3D, 0) +
          add_immediate(buffer, operands[1].op_value, 2) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpw: ax, imm16
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[8],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x83, 0) +
          add_modrm(buffer,
              3,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpw: r16, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[8],
        OPERAND_TYPES[6],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x81, 0) +
          add_modrm(buffer,
              3,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 2) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpw: r16, imm16
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[8],
        OPERAND_TYPES[8],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x39, 0) +
          add_modrm_reg_reg(buffer,
              3,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
          add_opcode(buffer, 0x3B, 0) +
          add_modrm_reg_reg(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpw: r16, r16
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[8],
        OPERAND_TYPES[9],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
          add_opcode(buffer, 0x3B, 0) +
          add_modrm_reg_mem(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpw: r16, m16
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[33],
        OPERAND_TYPES[11],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_opcode(buffer, 0x3D, 0) +
          add_immediate(buffer, operands[1].op_value, 4) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpl: eax, imm32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[13],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x83, 0) +
          add_modrm(buffer,
              3,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpl: r32, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[13],
        OPERAND_TYPES[11],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x81, 0) +
          add_modrm(buffer,
              3,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 4) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpl: r32, imm32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[13],
        OPERAND_TYPES[13],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x39, 0) +
          add_modrm_reg_reg(buffer,
              3,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
          add_opcode(buffer, 0x3B, 0) +
          add_modrm_reg_reg(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpl: r32, r32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[13],
        OPERAND_TYPES[14],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
          add_opcode(buffer, 0x3B, 0) +
          add_modrm_reg_mem(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpl: r32, m32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[34],
        OPERAND_TYPES[11],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              0,
              0,
              0) +
          add_opcode(buffer, 0x3D, 0) +
          add_immediate(buffer, operands[1].op_value, 4) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpq: rax, imm32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[17],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              0,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x83, 0) +
          add_modrm(buffer,
              3,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpq: r64, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[17],
        OPERAND_TYPES[11],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              0,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x81, 0) +
          add_modrm(buffer,
              3,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 4) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpq: r64, imm32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[17],
        OPERAND_TYPES[17],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              operands[1].rex_value,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x39, 0) +
          add_modrm_reg_reg(buffer,
              3,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
          add_opcode(buffer, 0x3B, 0) +
          add_modrm_reg_reg(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpq: r64, r64
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[17],
        OPERAND_TYPES[18],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
          add_opcode(buffer, 0x3B, 0) +
          add_modrm_reg_mem(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpq: r64, m64
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[4],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x80, 0) +
          add_modrm(buffer,
              0,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpb: m8, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[4],
        OPERAND_TYPES[3],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x38, 0) +
          add_modrm_mem_reg(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpb: m8, r8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[9],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x83, 0) +
          add_modrm(buffer,
              0,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpw: m16, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[9],
        OPERAND_TYPES[6],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x81, 0) +
          add_modrm(buffer,
              0,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 2) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpw: m16, imm16
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[9],
        OPERAND_TYPES[8],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, false) +
          add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x39, 0) +
          add_modrm_mem_reg(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpw: m16, r16
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[14],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x83, 0) +
          add_modrm(buffer,
              0,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpl: m32, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[14],
        OPERAND_TYPES[11],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x81, 0) +
          add_modrm(buffer,
              0,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 4) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpl: m32, imm32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[14],
        OPERAND_TYPES[13],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x39, 0) +
          add_modrm_mem_reg(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpl: m32, r32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[18],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x83, 0) +
          add_modrm(buffer,
              0,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpq: m64, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[18],
        OPERAND_TYPES[11],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x81, 0) +
          add_modrm(buffer,
              0,
              7,
              operands[0].op_value, operands) +
          add_immediate(buffer, operands[1].op_value, 4) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpq: m64, imm32
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[18],
        OPERAND_TYPES[17],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              true,
              1,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x39, 0) +
          add_modrm_mem_reg(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # cmpq: m64, r64
    forms << Form.new(operands, encodings)
    CMP = Instruction.new("CMP", forms)
  end
end
