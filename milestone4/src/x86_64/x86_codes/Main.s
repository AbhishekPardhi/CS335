
Main.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [esi],ah
   a:	or     al,BYTE PTR [eax]
   c:	or     BYTE PTR [eax],al
   e:	sbb    BYTE PTR [ecx],cl
  10:	add    BYTE PTR [ecx],bl
  12:	add    BYTE PTR [edx],bl
  14:	or     al,BYTE PTR [eax]
  16:	sbb    eax,DWORD PTR [eax]
  18:	sbb    al,0x7
  1a:	add    BYTE PTR ds:0x4000a,bl
  20:	sbb    BYTE PTR [edx],cl
  22:	add    BYTE PTR [eax+eax*1],al
  25:	push   ds
  26:	or     al,BYTE PTR [eax]
  28:	add    al,0x0
  2a:	pop    ds
  2b:	pop    es
  2c:	add    BYTE PTR [eax],ah
  2e:	add    DWORD PTR [eax],eax
  30:	add    DWORD PTR [ebx+0x1],esi
  33:	add    BYTE PTR [ecx],al
  35:	dec    ecx
  36:	add    DWORD PTR [eax],eax
  38:	add    DWORD PTR [ecx+eax*1+0x0],esi
  3c:	push   es
  3d:	cmp    al,0x69
  3f:	outs   dx,BYTE PTR ds:[esi]
  40:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  48:	push   esi
  49:	add    DWORD PTR [eax],eax
  4b:	add    al,0x43
  4d:	outs   dx,DWORD PTR ds:[esi]
  4e:	fs add DWORD PTR gs:[eax],eax
  52:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  56:	gs dec esi
  58:	jne    0xc7
  5a:	bound  esp,QWORD PTR [ebp+0x72]
  5d:	push   esp
  5e:	popa   
  5f:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  63:	add    BYTE PTR [ebx],al
  65:	popa   
  66:	fs add DWORD PTR fs:[eax],eax
  6a:	add    eax,0x29494928
  6f:	dec    ecx
  70:	add    DWORD PTR [eax],eax
  72:	push   es
  73:	jae    0xe6
  75:	jne    0xd8
  77:	jb     0xde
  79:	add    DWORD PTR [eax],eax
  7b:	add    al,0x28
  7d:	dec    ecx
  7e:	sub    DWORD PTR [esi+0x1],edx
  81:	add    BYTE PTR [ebp*2+0x16e6961],al
  88:	add    BYTE PTR [esi],dl
  8a:	sub    BYTE PTR [ebx+0x4c],bl
  8d:	push   0x61
  8f:	jbe    0xf2
  91:	das    
  92:	ins    BYTE PTR es:[edi],dx
  93:	popa   
  94:	outs   dx,BYTE PTR ds:[esi]
  95:	addr16 das 
  97:	push   ebx
  98:	je     0x10c
  9a:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  a1:	add    BYTE PTR [edx],cl
  a3:	push   ebx
  a4:	outs   dx,DWORD PTR ds:[esi]
  a5:	jne    0x119
  a7:	arpl   WORD PTR [ebp+0x46],sp
  aa:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x614d0900
  b2:	imul   ebp,DWORD PTR [esi+0x2e],0x6176616a
  b9:	or     al,0x0
  bb:	or     al,0x0
  bd:	or     eax,0xc210007
  c2:	add    BYTE PTR [edx],ah
  c4:	add    BYTE PTR [ebx],ah
  c6:	pop    es
  c7:	add    BYTE PTR [esp+ecx*1],ah
  ca:	add    BYTE PTR ds:0x11300,ah
  d0:	add    al,0x4d
  d2:	popa   
  d3:	imul   ebp,DWORD PTR [esi+0xc],0x11001000
  da:	or     al,0x0
  dc:	adc    al,BYTE PTR [eax]
  de:	adc    eax,DWORD PTR [ecx]
  e0:	add    BYTE PTR [eax],dl
  e2:	push   0x61
  e4:	jbe    0x147
  e6:	das    
  e7:	ins    BYTE PTR es:[edi],dx
  e8:	popa   
  e9:	outs   dx,BYTE PTR ds:[esi]
  ea:	addr16 das 
  ec:	dec    edi
  ed:	bound  ebp,QWORD PTR [edx+0x65]
  f0:	arpl   WORD PTR [ecx+eax*1+0x0],si
  f4:	adc    BYTE PTR [edx+0x61],ch
  f7:	jbe    0x15a
  f9:	das    
  fa:	ins    BYTE PTR es:[edi],dx
  fb:	popa   
  fc:	outs   dx,BYTE PTR ds:[esi]
  fd:	addr16 das 
  ff:	push   ebx
 100:	jns    0x175
 102:	je     0x169
 104:	ins    DWORD PTR es:[edi],dx
 105:	add    DWORD PTR [eax],eax
 107:	add    ebp,DWORD PTR [edi+0x75]
 10a:	je     0x10d
 10c:	add    BYTE PTR ds:0x76616a4c,dl
 112:	popa   
 113:	das    
 114:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 11b:	je     0x170
 11d:	je     0x191
 11f:	gs popa 
 121:	ins    DWORD PTR es:[edi],dx
 122:	cmp    eax,DWORD PTR [ecx]
 124:	add    BYTE PTR [ebx],dl
 126:	push   0x61
 128:	jbe    0x18b
 12a:	das    
 12b:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 132:	je     0x187
 134:	je     0x1a8
 136:	gs popa 
 138:	ins    DWORD PTR es:[edi],dx
 139:	add    DWORD PTR [eax],eax
 13b:	pop    es
 13c:	jo     0x1b0
 13e:	imul   ebp,DWORD PTR [esi+0x74],0x20006e6c
 145:	add    BYTE PTR [eax+eax*1],al
 148:	or     BYTE PTR [eax],al
 14a:	add    BYTE PTR [eax],al
 14c:	add    al,BYTE PTR [eax]
 14e:	add    BYTE PTR [eax],al
 150:	or     DWORD PTR [eax],eax
 152:	or     al,BYTE PTR [eax]
 154:	add    BYTE PTR [eax],al
 156:	add    BYTE PTR [eax],al
 158:	or     eax,DWORD PTR [eax]
 15a:	or     al,BYTE PTR [eax]
 15c:	add    BYTE PTR [eax],al
 15e:	add    al,0x0
 160:	add    BYTE PTR [eax],al
 162:	or     al,0x0
 164:	or     eax,0xe000100
 169:	add    BYTE PTR [eax],al
 16b:	add    BYTE PTR ds:0x1000100,bl
 171:	add    BYTE PTR [eax],al
 173:	add    BYTE PTR ds:0x100b72a,al
 179:	mov    cl,0x0
 17b:	add    BYTE PTR [eax],al
 17d:	add    DWORD PTR [eax],eax
 17f:	sldt   WORD PTR [eax]
 182:	add    BYTE PTR [esi],al
 184:	add    BYTE PTR [ecx],al
 186:	add    BYTE PTR [eax],al
 188:	add    BYTE PTR [eax+eax*1],al
 18b:	add    DWORD PTR [eax],eax
 18d:	adc    BYTE PTR [eax],al
 18f:	adc    DWORD PTR [eax],eax
 191:	add    DWORD PTR [eax],eax
 193:	push   cs
 194:	add    BYTE PTR [eax],al
 196:	add    BYTE PTR [edx],ah
 198:	add    BYTE PTR [edx],al
 19a:	add    BYTE PTR [eax+eax*1],al
 19d:	add    BYTE PTR [eax],al
 19f:	push   es
 1a0:	sbb    ebx,DWORD PTR [eax+eiz*2]
 1a3:	ds sbb eax,0xac
 1a9:	add    DWORD PTR [eax],eax
 1ab:	sldt   WORD PTR [eax]
 1ae:	add    BYTE PTR [edx],cl
 1b0:	add    BYTE PTR [edx],al
 1b2:	add    BYTE PTR [eax],al
 1b4:	add    BYTE PTR [edx],cl
 1b6:	add    BYTE PTR [eax+eax*1],al
 1b9:	or     eax,DWORD PTR [eax]
 1bb:	add    DWORD PTR [eax],eax
 1bd:	adc    al,BYTE PTR [eax]
 1bf:	adc    eax,DWORD PTR [eax]
 1c1:	add    DWORD PTR [eax],eax
 1c3:	push   cs
 1c4:	add    BYTE PTR [eax],al
 1c6:	add    BYTE PTR [eax+eax*1],ch
 1c9:	add    al,BYTE PTR [eax]
 1cb:	add    eax,DWORD PTR [eax]
 1cd:	add    BYTE PTR [eax],al
 1cf:	or     al,0x1b
 1d1:	sbb    ebp,DWORD PTR [eax+0x3d]
 1d4:	mov    dl,0x0
 1d6:	add    bl,BYTE PTR [esi+esi*4]
 1d9:	add    BYTE PTR [ebx],al
 1db:	mov    cl,0x0
 1dd:	add    BYTE PTR [eax],al
 1df:	add    DWORD PTR [eax],eax
 1e1:	sldt   WORD PTR [eax]
 1e4:	add    BYTE PTR [esi],cl
 1e6:	add    BYTE PTR [ebx],al
 1e8:	add    BYTE PTR [eax],al
 1ea:	add    BYTE PTR [eax],dl
 1ec:	add    BYTE PTR [eax+eax*1],al
 1ef:	adc    DWORD PTR [eax],eax
 1f1:	or     eax,DWORD PTR [eax]
 1f3:	adc    al,BYTE PTR [eax]
 1f5:	or     DWORD PTR [eax],eax
 1f7:	adc    al,0x0
 1f9:	adc    eax,0xe000100
 1fe:	add    BYTE PTR [eax],al
 200:	add    BYTE PTR ds:0x2000400,dh
 206:	add    BYTE PTR [eax],al
 208:	add    BYTE PTR ds:0x590400bb,dl
 20e:	mov    bh,0x0
 210:	add    eax,0x102b2b4c
 215:	movups xmm1,XMMWORD PTR [ecx]
 218:	mov    dh,0x0
 21a:	push   es
 21b:	mov    dh,0x0
 21d:	pop    es
 21e:	mov    cl,0x0
 220:	add    BYTE PTR [eax],al
 222:	add    DWORD PTR [eax],eax
 224:	sldt   WORD PTR [eax]
 227:	add    BYTE PTR [esi],cl
 229:	add    BYTE PTR [ebx],al
 22b:	add    BYTE PTR [eax],al
 22d:	add    BYTE PTR ds:0x19000800,dl
 233:	add    BYTE PTR [eax+eax*1],dl
 236:	sbb    eax,DWORD PTR [eax]
 238:	add    DWORD PTR [eax],eax
 23a:	push   ss
 23b:	add    BYTE PTR [eax],al
 23d:	add    BYTE PTR [edx],al
 23f:	add    BYTE PTR [edi],dl
