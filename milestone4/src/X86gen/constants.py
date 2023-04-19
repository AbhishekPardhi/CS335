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
regs=["%rbx","%rcx","%rdx","%r8","%r9","%r10","%r11","%r12","%r13","%r14","%r15"]
for i in range(len(regs)):
    regMap[i]=regs[i]


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
opMap["/"]="idivq"
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

# map to store BB to instruction number mapping
BBMap={}

# map to store variable type to size
typeSize={}
typeSize["byte"] = 1
typeSize["short"] = 2
typeSize["int"] = 4
typeSize["long"] = 8
typeSize["float"] = 4
typeSize["double"] = 8
typeSize["boolean"] = 1
typeSize["char"] = 2
typeSize["void"] = 0
typeSize["ptr"] = 4

# map correseponding mov instruction to size
movMap={}
movMap[1]="movb"
movMap[2]="movw"
movMap[4]="movl"
movMap[8]="movq"
