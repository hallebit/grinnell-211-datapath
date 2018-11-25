import assembler
import pips

# The instruction decorator tells the assembler to create a new syntax rule for add instructions.
# The "#" spots indicate operands, which are passed in as parameters to the function below.
# The second parameter indicates the number of instructions this rule will create (1 in this case)
@assembler.instruction('add #, #, #', 1)
def add(dest, operand1, operand2):
  return pips.rformat(opcode='add', r0=dest, r1=operand1, r2=operand2)

# Encode an addi instruction
@assembler.instruction('addi #, #, #', 1)
def addi(dest, op1, immediate):
  return pips.iformat(opcode='add', r0=dest, r1=op1, imm=immediate)
  
# Encode the li pseudoinstruction using an addition to zero
@assembler.instruction('li #, #', 1)
def li(dest, immediate):
  return addi(dest, '$zero', immediate)

# Encode a sub instruction
@assembler.instruction('sub #, #, #', 1)
def sub(dest, operand1, operand2):
  return pips.rformat(opcode='sub', r0=dest, r1=operand1, r2=operand2)

# Encode a subi instruction
@assembler.instruction('subi #, #, #', 1)
def subi(dest, op1, immediate):
  return pips.iformat(opcode='sub', r0=dest, r1=op1, imm=immediate)

# Encode an and instruction
@assembler.instruction('and #, #, #', 1)
def and_(dest, operand1, operand2):
  return pips.rformat(opcode='and', r0=dest, r1=operand1, r2=operand2)

# Encode an andi instruction
@assembler.instruction('andi #, #, #', 1)
def andi(dest, op1, immediate):
  return pips.iformat(opcode='and', r0=dest, r1=op1, imm=immediate)

# Encode a or instruction
@assembler.instruction('or #, #, #', 1)
def or_(dest, operand1, operand2):
  return pips.rformat(opcode='or', r0=dest, r1=operand1, r2=operand2)

# Encode a ori instruction
@assembler.instruction('ori #, #, #', 1)
def ori(dest, op1, immediate):
  return pips.iformat(opcode='or', r0=dest, r1=op1, imm=immediate)

# Encode an nand instruction
@assembler.instruction('nand #, #, #', 1)
def nand(dest, operand1, operand2):
  return pips.rformat(opcode='nand', r0=dest, r1=operand1, r2=operand2)

# Encode an nandi instruction
@assembler.instruction('nandi #, #, #', 1)
def nandi(dest, op1, immediate):
  return pips.iformat(opcode='nand', r0=dest, r1=op1, imm=immediate)

# Encode an nor instruction
@assembler.instruction('nor #, #, #', 1)
def nor(dest, operand1, operand2):
  return pips.rformat(opcode='nor', r0=dest, r1=operand1, r2=operand2)

# Encode an nori instruction
@assembler.instruction('nori #, #, #', 1)
def nori(dest, op1, immediate):
  return pips.iformat(opcode='nor', r0=dest, r1=op1, imm=immediate)

# Encode an xor instruction
@assembler.instruction('xor #, #, #', 1)
def xor(dest, operand1, operand2):
  return pips.rformat(opcode='xor', r0=dest, r1=operand1, r2=operand2)

# Encode an xori instruction
@assembler.instruction('xori #, #, #', 1)
def xori(dest, op1, immediate):
  return pips.iformat(opcode='xor', r0=dest, r1=op1, imm=immediate)

# Encode an slt instruction
@assembler.instruction('slt #, #, #', 1)
def slt(dest, operand1, operand2):
  return pips.rformat(opcode='slt', r0=dest, r1=operand1, r2=operand2)

# Encode an slti instruction
@assembler.instruction('slti #, #, #', 1)
def slti(dest, op1, immediate):
  return pips.iformat(opcode='slt', r0=dest, r1=op1, imm=immediate)

# Encode an sltu instruction
@assembler.instruction('sltu #, #, #', 1)
def sltu(dest, operand1, operand2):
  return pips.rformat(opcode='sltu', r0=dest, r1=operand1, r2=operand2)

# Encode an sltiu instruction
@assembler.instruction('sltiu #, #, #', 1)
def sltiu(dest, op1, immediate):
  return pips.iformat(opcode='sltu', r0=dest, r1=op1, imm=immediate)

# Encode a j instruction
@assembler.instruction('j #', 1)
def j(immediate):
  return pips.iformat(opcode='j', r0='$zero', r1='$zero', imm=immediate)

# Encode a jal instruction
@assembler.instruction('jal #', 1)
def jal(immediate):
  return pips.iformat(opcode='j', r0='$ra', r1='$zero', imm=immediate, link=True)

# Encode a jr instruction
@assembler.instruction('jr #', 1)
def jr(dest):
  return pips.rformat(opcode='j', r0='$zero', r1='$zero', r2=dest)

# Encode a beq instruction
@assembler.instruction('beq #, #, #', 1)
def beq(operand1, operand2, immediate):
  return pips.iformat(opcode='beq', r0=operand1, r1=operand2, imm=immediate)

# Encode a bne instruction
@assembler.instruction('bne #, #, #', 1)
def bne(operand1, operand2, immediate):
  return pips.iformat(opcode='bne', r0=operand1, r1=operand2, imm=immediate)

# Encode a lw instruction
@assembler.instruction('lw #, #(#)', 1)
def lw(dest, immediate, operand1):
  return pips.iformat(opcode='lw', r0=dest, r1=operand1, imm=immediate)

# Encode a sw instruction
@assembler.instruction('sw #, #(#)', 1)
def sw(dest, immediate, operand1):
  return pips.iformat(opcode='sw', r0=dest, r1=operand1, imm=immediate)

# Encode a lb instruction
@assembler.instruction('lb #, #(#)', 1)
def lb(dest, immediate, operand1):
  return pips.iformat(opcode='lb', r0=dest, r1=operand1, imm=immediate)

# Encode a sb instruction
@assembler.instruction('sb #, #(#)', 1)
def sb(dest, immediate, operand1):
  return pips.iformat(opcode='sb', r0=dest, r1=operand1, imm=immediate)

# Encode a sll instruction
@assembler.instruction('sll #, #, #', 1)
def sll(dest, operand1, immediate):
  return pips.rformat(opcode='add', r0=dest, r1='$zero', r2=operand1, shift_type=pips.SHIFT_LEFT, shift_amt=immediate)

# Encode a srl instruction
@assembler.instruction('srl #, #, #', 1)
def srl(dest, operand1, immediate):
  return pips.rformat(opcode='add', r0=dest, r1='$zero', r2=operand1, shift_type=pips.SHIFT_RIGHT_LOGICAL, shift_amt=immediate)

# Encode a sra instruction
@assembler.instruction('sra #, #, #', 1)
def sra(dest, operand1, immediate):
  return pips.rformat(opcode='add', r0=dest, r1='$zero', r2=operand1, shift_type=pips.SHIFT_RIGHT_ARITHMETIC, shift_amt=immediate)

# Encode a not instruction
@assembler.instruction('not #, #', 1)
def not_instr(dest, op1):
  return pips.iformat(opcode='xor', r0=dest, r1=op1, imm=65535)

#Encode a push instruction
@assembler.instruction('push #', 2) 
def push_instr(reg):
  return addi('$sp', '$sp', '-2') + sw(reg, 0, '$sp')

#Encode a pop instruction
@assembler.instruction('pop #', 2) 
def pop_instr(reg):
  return lw(reg, 0, '$sp') + addi('$sp', '$sp', '2')

# Encode a blt instruction
@assembler.instruction('blt! #, #, #', 2)
def blt(operand1, operand2, immediate):
  return slt(operand1, operand1, operand2) + bne(operand1, '$zero', immediate)

# Encode a ble instruction
@assembler.instruction('ble! #, #, #', 2)
def ble(operand1, operand2, immediate):
  return slt(operand1, operand2, operand1) + beq(operand1, '$zero', immediate)

# Encode a bge instruction
@assembler.instruction('bge! #, #, #', 2)
def bge(operand1, operand2, immediate):
  return slt(operand1, operand1, operand2) + beq(operand1, '$zero', immediate)

# Encode a bgt instruction
@assembler.instruction('bgt! #, #, #', 2)
def bgt(operand1, operand2, immediate):
  return slt(operand1, operand2, operand1) + bne(operand1, '$zero', immediate)

# Encode a nop instruction
@assembler.instruction('nop', 1)
def nop():
  return pips.iformat(opcode='add', r0='$zero', r1='$zero', imm=0)
