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
regMap[0]="%eax"
regMap[1]="%ebx"
regMap[2]="%ecx"
regMap[3]="%edx"
regMap[4]="%esi"
regMap[5]="%edi"

# Register and Adddress Descriptors
# Register Descriptor
RegDesc={}
for i in range(len(regMap)):
    RegDesc[regMap[i]]=[]

# Address Descriptor
AddrDesc={}
