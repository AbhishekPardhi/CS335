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