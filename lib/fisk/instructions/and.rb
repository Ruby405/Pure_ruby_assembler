# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction AND: Logical AND
    AND = Instruction.new("AND", [
    # andb: al, imm8
      Form.new([
        OPERAND_TYPES[0],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_opcode(buffer, 0x24, 0) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andb: r8, imm8
      Form.new([
        OPERAND_TYPES[2],
        OPERAND_TYPES[1],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andb: r8, r8
      Form.new([
        OPERAND_TYPES[2],
        OPERAND_TYPES[3],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x20, 0) +
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
            add_opcode(buffer, 0x22, 0) +
            add_modrm_reg_reg(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andb: r8, m8
      Form.new([
        OPERAND_TYPES[2],
        OPERAND_TYPES[4],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
            add_opcode(buffer, 0x22, 0) +
            add_modrm_reg_mem(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andw: ax, imm16
      Form.new([
        OPERAND_TYPES[5],
        OPERAND_TYPES[6],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, false) +
            add_opcode(buffer, 0x25, 0) +
            add_immediate(buffer, operands[1].op_value, 2) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andw: r16, imm8
      Form.new([
        OPERAND_TYPES[7],
        OPERAND_TYPES[1],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andw: r16, imm16
      Form.new([
        OPERAND_TYPES[7],
        OPERAND_TYPES[6],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 2) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andw: r16, r16
      Form.new([
        OPERAND_TYPES[7],
        OPERAND_TYPES[8],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, false) +
            add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x21, 0) +
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
            add_opcode(buffer, 0x23, 0) +
            add_modrm_reg_reg(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andw: r16, m16
      Form.new([
        OPERAND_TYPES[7],
        OPERAND_TYPES[9],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, false) +
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
            add_opcode(buffer, 0x23, 0) +
            add_modrm_reg_mem(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andl: eax, imm32
      Form.new([
        OPERAND_TYPES[10],
        OPERAND_TYPES[11],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_opcode(buffer, 0x25, 0) +
            add_immediate(buffer, operands[1].op_value, 4) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andl: r32, imm8
      Form.new([
        OPERAND_TYPES[12],
        OPERAND_TYPES[1],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andl: r32, imm32
      Form.new([
        OPERAND_TYPES[12],
        OPERAND_TYPES[11],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 4) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andl: r32, r32
      Form.new([
        OPERAND_TYPES[12],
        OPERAND_TYPES[13],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x21, 0) +
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
            add_opcode(buffer, 0x23, 0) +
            add_modrm_reg_reg(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andl: r32, m32
      Form.new([
        OPERAND_TYPES[12],
        OPERAND_TYPES[14],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
            add_opcode(buffer, 0x23, 0) +
            add_modrm_reg_mem(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andq: rax, imm32
      Form.new([
        OPERAND_TYPES[15],
        OPERAND_TYPES[11],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              true,
              1,
              0,
              0,
              0) +
            add_opcode(buffer, 0x25, 0) +
            add_immediate(buffer, operands[1].op_value, 4) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andq: r64, imm8
      Form.new([
        OPERAND_TYPES[16],
        OPERAND_TYPES[1],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andq: r64, imm32
      Form.new([
        OPERAND_TYPES[16],
        OPERAND_TYPES[11],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 4) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andq: r64, r64
      Form.new([
        OPERAND_TYPES[16],
        OPERAND_TYPES[17],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              true,
              1,
              operands[1].rex_value,
              0,
              operands[0].rex_value) +
            add_opcode(buffer, 0x21, 0) +
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
            add_opcode(buffer, 0x23, 0) +
            add_modrm_reg_reg(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andq: r64, m64
      Form.new([
        OPERAND_TYPES[16],
        OPERAND_TYPES[18],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              true,
              1,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
            add_opcode(buffer, 0x23, 0) +
            add_modrm_reg_mem(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andb: m8, imm8
      Form.new([
        OPERAND_TYPES[19],
        OPERAND_TYPES[1],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andb: m8, r8
      Form.new([
        OPERAND_TYPES[19],
        OPERAND_TYPES[3],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
            add_opcode(buffer, 0x20, 0) +
            add_modrm_mem_reg(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andw: m16, imm8
      Form.new([
        OPERAND_TYPES[20],
        OPERAND_TYPES[1],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andw: m16, imm16
      Form.new([
        OPERAND_TYPES[20],
        OPERAND_TYPES[6],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 2) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andw: m16, r16
      Form.new([
        OPERAND_TYPES[20],
        OPERAND_TYPES[8],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_prefix(buffer, operands, 0x66, false) +
            add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
            add_opcode(buffer, 0x21, 0) +
            add_modrm_mem_reg(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andl: m32, imm8
      Form.new([
        OPERAND_TYPES[21],
        OPERAND_TYPES[1],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andl: m32, imm32
      Form.new([
        OPERAND_TYPES[21],
        OPERAND_TYPES[11],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 4) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andl: m32, r32
      Form.new([
        OPERAND_TYPES[21],
        OPERAND_TYPES[13],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              false,
              0,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
            add_opcode(buffer, 0x21, 0) +
            add_modrm_mem_reg(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andq: m64, imm8
      Form.new([
        OPERAND_TYPES[22],
        OPERAND_TYPES[1],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andq: m64, imm32
      Form.new([
        OPERAND_TYPES[22],
        OPERAND_TYPES[11],
      ].freeze, [
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
              4,
              operands[0].op_value, operands) +
            add_immediate(buffer, operands[1].op_value, 4) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # andq: m64, r64
      Form.new([
        OPERAND_TYPES[22],
        OPERAND_TYPES[17],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_rex(buffer, operands,
              true,
              1,
              operands[1].rex_value,
              operands[0].rex_value,
              operands[0].rex_value) +
            add_opcode(buffer, 0x21, 0) +
            add_modrm_mem_reg(buffer,
              0,
              operands[1].op_value,
              operands[0].op_value, operands) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
