
ExampleExpression.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [ecx],ah
   a:	or     al,BYTE PTR [eax]
   c:	pop    es
   d:	add    BYTE PTR [edx],dl
   f:	or     DWORD PTR [eax],eax
  11:	adc    eax,DWORD PTR [eax]
  13:	adc    al,0x8
  15:	add    BYTE PTR ds:0x16000a,dl
  1b:	pop    ss
  1c:	or     al,BYTE PTR [eax]
  1e:	push   es
  1f:	add    BYTE PTR [eax],bl
  21:	pop    es
  22:	add    BYTE PTR [ecx],bl
  24:	pop    es
  25:	add    BYTE PTR [edx],bl
  27:	add    DWORD PTR [eax],eax
  29:	push   es
  2a:	cmp    al,0x69
  2c:	outs   dx,BYTE PTR ds:[esi]
  2d:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  35:	push   esi
  36:	add    DWORD PTR [eax],eax
  38:	add    al,0x43
  3a:	outs   dx,DWORD PTR ds:[esi]
  3b:	fs add DWORD PTR gs:[eax],eax
  3f:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  43:	gs dec esi
  45:	jne    0xb4
  47:	bound  esp,QWORD PTR [ebp+0x72]
  4a:	push   esp
  4b:	popa   
  4c:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  50:	add    BYTE PTR [ecx],cl
  52:	jae    0xc3
  54:	ins    DWORD PTR es:[edi],dx
  55:	gs je  0xc0
  58:	imul   ebp,DWORD PTR [esi+0x67],0x28040001
  5f:	dec    ecx
  60:	sub    DWORD PTR [ecx+0x1],ecx
  63:	add    BYTE PTR [ebp*2+0x16e6961],al
  6a:	add    BYTE PTR [esi],dl
  6c:	sub    BYTE PTR [ebx+0x4c],bl
  6f:	push   0x61
  71:	jbe    0xd4
  73:	das    
  74:	ins    BYTE PTR es:[edi],dx
  75:	popa   
  76:	outs   dx,BYTE PTR ds:[esi]
  77:	addr16 das 
  79:	push   ebx
  7a:	je     0xee
  7c:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  83:	add    BYTE PTR [edx],cl
  85:	push   ebx
  86:	outs   dx,DWORD PTR ds:[esi]
  87:	jne    0xfb
  89:	arpl   WORD PTR [ebp+0x46],sp
  8c:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x78451600
  94:	popa   
  95:	ins    DWORD PTR es:[edi],dx
  96:	jo     0x104
  98:	gs inc ebp
  9a:	js     0x10c
  9c:	jb     0x103
  9e:	jae    0x113
  a0:	imul   ebp,DWORD PTR [edi+0x6e],0x76616a2e
  a7:	popa   
  a8:	or     al,0x0
  aa:	or     BYTE PTR [eax],al
  ac:	or     DWORD PTR [edi],eax
  ae:	add    BYTE PTR [ebx],bl
  b0:	or     al,0x0
  b2:	sbb    al,0x0
  b4:	sbb    eax,0x480c0001
  b9:	gs ins BYTE PTR es:[edi],dx
  bb:	ins    BYTE PTR es:[edi],dx
  bc:	outs   dx,DWORD PTR ds:[esi]
  bd:	and    BYTE PTR [edi+0x6f],dh
  c0:	jb     0x12e
  c2:	and    DWORD PTR fs:[edi],eax
  c5:	add    BYTE PTR [esi],bl
  c7:	or     al,0x0
  c9:	pop    ds
  ca:	add    BYTE PTR [eax],ah
  cc:	or     al,0x0
  ce:	or     al,0x0
  d0:	or     eax,0x45110001
  d5:	js     0x138
  d7:	ins    DWORD PTR es:[edi],dx
  d8:	jo     0x146
  da:	gs inc ebp
  dc:	js     0x14e
  de:	jb     0x145
  e0:	jae    0x155
  e2:	imul   ebp,DWORD PTR [edi+0x6e],0x6a100001
  e9:	popa   
  ea:	jbe    0x14d
  ec:	das    
  ed:	ins    BYTE PTR es:[edi],dx
  ee:	popa   
  ef:	outs   dx,BYTE PTR ds:[esi]
  f0:	addr16 das 
  f2:	dec    edi
  f3:	bound  ebp,QWORD PTR [edx+0x65]
  f6:	arpl   WORD PTR [ecx+eax*1+0x0],si
  fa:	adc    BYTE PTR [edx+0x61],ch
  fd:	jbe    0x160
  ff:	das    
 100:	ins    BYTE PTR es:[edi],dx
 101:	popa   
 102:	outs   dx,BYTE PTR ds:[esi]
 103:	addr16 das 
 105:	push   ebx
 106:	jns    0x17b
 108:	je     0x16f
 10a:	ins    DWORD PTR es:[edi],dx
 10b:	add    DWORD PTR [eax],eax
 10d:	add    ebp,DWORD PTR [edi+0x75]
 110:	je     0x113
 112:	add    BYTE PTR ds:0x76616a4c,dl
 118:	popa   
 119:	das    
 11a:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 121:	je     0x176
 123:	je     0x197
 125:	gs popa 
 127:	ins    DWORD PTR es:[edi],dx
 128:	cmp    eax,DWORD PTR [ecx]
 12a:	add    BYTE PTR [ebx],dl
 12c:	push   0x61
 12e:	jbe    0x191
 130:	das    
 131:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 138:	je     0x18d
 13a:	je     0x1ae
 13c:	gs popa 
 13e:	ins    DWORD PTR es:[edi],dx
 13f:	add    DWORD PTR [eax],eax
 141:	pop    es
 142:	jo     0x1b6
 144:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 14b:	adc    eax,0x616a4c28
 150:	jbe    0x1b3
 152:	das    
 153:	ins    BYTE PTR es:[edi],dx
 154:	popa   
 155:	outs   dx,BYTE PTR ds:[esi]
 156:	addr16 das 
 158:	push   ebx
 159:	je     0x1cd
 15b:	imul   ebp,DWORD PTR [esi+0x67],0x56293b
 162:	and    DWORD PTR [eax],eax
 164:	push   es
 165:	add    BYTE PTR [edi],al
 167:	add    BYTE PTR [eax],al
 169:	add    BYTE PTR [eax],al
 16b:	add    BYTE PTR [ebx],al
 16d:	add    BYTE PTR [ecx],al
 16f:	add    BYTE PTR [eax],cl
 171:	add    BYTE PTR [ecx],cl
 173:	add    BYTE PTR [ecx],al
 175:	add    BYTE PTR [edx],cl
 177:	add    BYTE PTR [eax],al
 179:	add    BYTE PTR ds:0x1000100,bl
 17f:	add    BYTE PTR [eax],al
 181:	add    BYTE PTR ds:0x100b72a,al
 187:	mov    cl,0x0
 189:	add    BYTE PTR [eax],al
 18b:	add    DWORD PTR [eax],eax
 18d:	or     eax,DWORD PTR [eax]
 18f:	add    BYTE PTR [eax],al
 191:	push   es
 192:	add    BYTE PTR [ecx],al
 194:	add    BYTE PTR [eax],al
 196:	add    BYTE PTR [ecx],dl
 198:	add    BYTE PTR [ecx],cl
 19a:	add    BYTE PTR [eax+eax*1],cl
 19d:	or     eax,0xa000100
 1a2:	add    BYTE PTR [eax],al
 1a4:	add    BYTE PTR ds:0x1000100,bl
 1aa:	add    BYTE PTR [eax],al
 1ac:	add    BYTE PTR ds:0x100841a,al
 1b2:	lods   al,BYTE PTR ds:[esi]
 1b3:	add    BYTE PTR [eax],al
 1b5:	add    BYTE PTR [ecx],al
 1b7:	add    BYTE PTR [ebx],cl
 1b9:	add    BYTE PTR [eax],al
 1bb:	add    BYTE PTR [esi],al
 1bd:	add    BYTE PTR [ecx],al
 1bf:	add    BYTE PTR [eax],al
 1c1:	add    BYTE PTR [ebx],dl
 1c3:	add    BYTE PTR [ecx],cl
 1c5:	add    BYTE PTR [esi],cl
 1c7:	add    BYTE PTR [edi],cl
 1c9:	add    BYTE PTR [ecx],al
 1cb:	add    BYTE PTR [edx],cl
 1cd:	add    BYTE PTR [eax],al
 1cf:	add    BYTE PTR [edi+0x0],al
 1d2:	add    eax,DWORD PTR [eax]
 1d4:	add    eax,DWORD PTR [eax]
 1d6:	add    BYTE PTR [eax],al
 1d8:	sbb    edx,DWORD PTR [eax]
 1da:	push   es
 1db:	mov    esp,0x3d054c0a
 1e0:	sub    eax,DWORD PTR [ebx]
 1e2:	sbb    al,0x4f
 1e4:	mov    dl,0x0
 1e6:	add    dl,BYTE PTR [edx]
 1e8:	add    esi,DWORD PTR [esi+0x32b0400]
 1ee:	cs mov eax,0xb1570500
 1f4:	add    BYTE PTR [eax],al
 1f6:	add    BYTE PTR [ecx],al
 1f8:	add    BYTE PTR [ebx],cl
 1fa:	add    BYTE PTR [eax],al
 1fc:	add    BYTE PTR [edx],bl
 1fe:	add    BYTE PTR [esi],al
 200:	add    BYTE PTR [eax],al
 202:	add    BYTE PTR [eax],bl
 204:	add    BYTE PTR ds:0x7001f00,al
 20a:	add    BYTE PTR [eax],ah
 20c:	add    BYTE PTR [ebx],cl
 20e:	add    BYTE PTR [ecx],ah
 210:	add    BYTE PTR [ebx],dl
 212:	add    BYTE PTR [edx],ah
 214:	add    BYTE PTR [edx],bl
 216:	add    BYTE PTR [ebx],ah
 218:	add    BYTE PTR [ecx],al
 21a:	add    BYTE PTR [eax],dl
 21c:	add    BYTE PTR [eax],al
 21e:	add    BYTE PTR [edx],al
 220:	add    BYTE PTR [ecx],dl
