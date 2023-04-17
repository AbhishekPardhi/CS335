class func_entry:
    def __init__(self,l):
        # for local var
        if len(l)==8:
            self.name=l[0]
            self.type=l[1]
            self.lineno=int(l[2])
            self.token=l[3]
            self.offset=int(l[4])
            self.is_static=int(l[5])
            self.is_final=int(l[6])
            self.numParam=0
            self.id=int(l[7])
        # for func decl and field decl
        elif len(l)==5:
            self.name=l[0]
            self.type=l[1]
            self.numParam=int(l[2])
            self.is_static=int(l[3])
            self.is_final=int(l[4])
            self.lineno=0
            self.token=""
            self.offset=int(l[2])
            self.id=-1