# symbol table as a map of map of entries "class"->"function"->"list of entries"
symTable={}

funcHeader="Function name,Return Type,Number of Parameters,IsStatic,Is_Final".split(",")
funcEntryHeader="Lexeme,Type,Line Number,Token,Offset,Is_Static,Is_Final".split(",")
fieldHeader="Field name,Return Type,Offset,Is_Static,Is_Final".split(",")

# Map from function id to the instruction number in 3AC
FMap={}

# list contatining 3AC code 
threeAC=[]

# list containing output code
out=[]

# map from regester id to regester name
regMap={}
regMap[0]="%rax"
regMap[1]="%rbx"
regMap[2]="%rcx"
regMap[3]="%rdx"
regMap[4]="%rsi"
regMap[5]="%rdi"
regMap[6]="%r8"
regMap[7]="%r9"
regMap[8]="%r10"
regMap[9]="%r11"
regMap[10]="%r12"
regMap[11]="%r13"
regMap[12]="%r14"
regMap[13]="%r15"


# Register and Adddress Descriptors
# Register Descriptor
RegDesc={}
for i in range(len(regMap)):
    RegDesc[regMap[i]]=[]

# Address Descriptor
AddrDesc={}

# Map from operator to assembly instruction
opMap={}
opMap["+"]="add"
opMap["-"]="sub"
opMap["*"]="imul"
opMap["/"]="idiv"
opMap["%"]="mod"
opMap["&"]="and"
opMap["|"]="or"
opMap["^"]="xor"
opMap["<<"]="shl"
opMap[">>"]="shr"
opMap["=="]="cmp"
opMap["!="]="cmp"
opMap[">"]="cmp"
opMap[">="]="cmp"
opMap["<"]="cmp"
opMap["<="]="cmp"

#Map for unary operators
unaryOpMap={}
unaryOpMap["~"]="not"
unaryOpMap["!"]="neg"

# current fucntion name
currFunc=""

# map to store new offsets of temp variables
tempOffsetMap={}
