E = {}
# OPCODE

E['ADD'] = ('000', '00000')
E['ADDI'] = ('000', '00001')
E['SUB'] = ('000', '00010')
E['SUBI'] = ('000', '00011')
E['AND'] = ('000', '00100')
E['ANDI'] = ('000', '00101')
E['OR'] = ('000', '00110')
E['ORI'] = ('000', '00111')
E['XOR'] = ('000', '01000')
E['XORI'] = ('000', '01001')
E['NOT'] = ('000', '01010')
E['SLA'] = ('000', '01011')
E['SLAI'] = ('000', '01100')
E['SRA'] = ('000', '01101')
E['SRAI'] = ('000', '01110')
E['SRL'] = ('000', '01111')
E['SRLI'] = ('000', '10000')

E['LD'] = ('001', '00000')
E['ST'] = ('001', '00001')
E['LDSP'] = ('001', '00010')
E['STSP'] = ('001', '00011')

E['BR'] = ('110', '00000') # speacial handle
E['BMI'] = ('010', '00001')
E['BPL'] = ('010', '00010')
E['BZ'] = ('010', '00011')

E['PUSH'] = ('011', '00001') # speacial handle
E['POP'] = ('011', '00001') # speacial handle
E['CALL'] = ('011', '00001') # speacial handle
E['RET'] = ('011', '00001') # speacial handle

E['MOVE'] = ('100', '00000') # speacial handle

E['HALT'] = ('101', '00001') #******** Don't know
E['NOP'] = ('101', '00001')  #******** Don't know

# REGISTERS
E['R0'] =  '00000'
E['R1'] =  '00001'
E['R2'] =  '00010'
E['R3'] =  '00011'
E['R4'] =  '00100'
E['R5'] =  '00101'
E['R6'] =  '00110'
E['R7'] =  '00111'
E['R8'] =  '01000'
E['R9'] =  '01001'
E['R10'] = '01010'
E['R11'] = '01011'
E['R12'] = '01100'
E['R13'] = '01101'
E['R14'] = '01110'
E['R15'] = '01111'
E['SP'] =  '10000'


def int_to_signed_binary_26bits(number):
    number = int(number)
    # Check if the number is within the valid range for a 26-bit signed integer
    if number < -2**25 or number >= 2**25:
        raise ValueError("Number is out of range for a 26-bit signed integer")

    # Calculate the binary representation with sign extension
    binary = bin(number & (2**26-1))[2:]  # Convert to binary and remove the '0b' prefix
    binary = binary.zfill(26)  # Add leading zeros to make it 26 bits long

    return str(binary)

def int_to_signed_binary_16bits(number):
    number = int(number)
    # print(number)
    # Check if the number is within the valid range for a 16-bit signed integer
    if number < -2**15 or number >= 2**15:
        raise ValueError("Number is out of range for a 16-bit signed integer")

    # Calculate the binary representation with sign extension
    binary = bin(number & (2**16-1))[2:]  # Convert to binary and remove the '0b' prefix
    binary = binary.zfill(16)  # Add leading zeros to make it 16 bits long

    return str(binary)

def int_to_signed_binary_14bits(number):
    number = int(number)
    # Check if the number is within the valid range for a 14-bit signed integer
    if number < -2**13 or number >= 2**13:
        raise ValueError("Number is out of range for a 14-bit signed integer")

    # Calculate the binary representation with sign extension
    binary = bin(number & (2**14-1))[2:]  # Convert to binary and remove the '0b' prefix
    binary = binary.zfill(14)  # Add leading zeros to make it 14 bits long

    return str(binary)



with open("/home/sukhomay/Desktop/COA_Lab/#A7/code.txt", 'r') as input_file, open("/home/sukhomay/Desktop/COA_Lab/#A7/binarycode.txt", 'w') as output_file:
    lines = input_file.readlines()
    idx = 0
    for line in lines:
        output_file.write(f"R[{idx}] = ")
        line = line.strip()
        if not line:
            continue  # Skip empty lines

        parts = line.split(' ', 1)  # Split on the first space

        # Print Opcode
        function = parts[0].strip()
        opcode = E[function][0]
        funcode = E[function][1]
        if(opcode=='100'): # MOVE
            output_file.write(f"{E['ADD'][0]}")
        elif(opcode=='011'):   # PUSH/POP/CALL/RET
            print("ERROR!")
        else:
            output_file.write(f"{opcode}")

        # Print Arguments
        args = parts[1].split(',') if len(parts) > 1 else []

        if(function == 'BR'): # Type 4 instr
            for arg in args:
                arg = arg.strip()
                output_file.write(f"000{int_to_signed_binary_26bits(arg[1:])}")
        elif(function == 'NOT' or function == 'SLA' or function == 'SRA' or function == 'SRL'):   # Type 3 instr
            arg0 = args[0].strip()
            arg1 = args[1].strip()
            output_file.write(f"{E[arg1]}{E[arg0]}00000000000000")
        elif(function == 'ADDI' or function == 'SUBI' or function == 'ANDI' or function == 'ORI' or function == 'XORI' or function == 'SLAI' or function == 'SRAI' or function == 'SRLI' or function == 'BMI' or function == 'BPL' or function == 'BZ'):    #Type 2 instr
            arg0 = args[0].strip()
            arg1 = args[1].strip()
            output_file.write(f"{E[arg0]}000{int_to_signed_binary_16bits(arg1[1:])}")
        elif(function == 'ADD' or function == 'SUB' or function == 'AND' or function == 'OR' or function == 'XOR'):     # Type 0 instr
            arg0 = args[0].strip()
            arg1 = args[1].strip()
            arg2 = args[2].strip()
            output_file.write(f"{E[arg1]}{E[arg2]}{E[arg0]}000000000")
        elif(function == 'LD' or function == 'ST' or function == 'LDSP' or function == 'STSP'):    # Type 1 instr
            arg0 = args[0].strip()
            arg1 = args[1].strip()
            # Split the string into two parts based on '('
            parts = arg1.split('(')
            if len(parts) == 2:
                arg1_imm = parts[0]
                arg1_reg = parts[1].split(')')[0]
            output_file.write(f"{E[arg1_reg]}{E[arg0]}{int_to_signed_binary_14bits(arg1_imm)}")
        elif(function == 'MOVE'):
            arg0 = args[0].strip()
            arg1 = args[1].strip()
            arg2 = 'R0'
            output_file.write(f"{E[arg1]}{E[arg2]}{E[arg0]}000000000")
        elif(function == 'NOP'):
            output_file.write(f"000000000000000000000000")
        elif(function == 'HALT'):
            output_file.write(f"000000000000000000000000")
        else:
            print("ERROR!")


        # Print Funcode
        if(function != 'BR'):
            output_file.write(f"{funcode}; //{line}\n")
        else:
            output_file.write(f"; //{line}\n")
        idx += 1
