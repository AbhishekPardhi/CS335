
GFG.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [edx],bl
   a:	or     al,BYTE PTR [eax]
   c:	push   es
   d:	add    BYTE PTR [edx+ecx*1],dl
  10:	add    BYTE PTR ds:0xa1500,al
  16:	add    eax,0x81600
  1b:	pop    ss
  1c:	pop    es
  1d:	add    BYTE PTR [eax],bl
  1f:	pop    es
  20:	add    BYTE PTR [ecx],bl
  22:	add    DWORD PTR [eax],eax
  24:	push   es
  25:	cmp    al,0x69
  27:	outs   dx,BYTE PTR ds:[esi]
  28:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  30:	push   esi
  31:	add    DWORD PTR [eax],eax
  33:	add    al,0x43
  35:	outs   dx,DWORD PTR ds:[esi]
  36:	fs add DWORD PTR gs:[eax],eax
  3a:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  3e:	gs dec esi
  40:	jne    0xaf
  42:	bound  esp,QWORD PTR [ebp+0x72]
  45:	push   esp
  46:	popa   
  47:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  4b:	add    BYTE PTR [ebx],al
  4d:	ins    DWORD PTR es:[edi],dx
  4e:	popa   
  4f:	js     0x52
  51:	add    BYTE PTR ds:0x29494928,al
  57:	dec    ecx
  58:	add    DWORD PTR [eax],eax
  5a:	or     eax,0x63617453
  5f:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  63:	push   esp
  64:	popa   
  65:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  69:	add    BYTE PTR [ebx],al
  6b:	ins    BYTE PTR es:[edi],dx
  6c:	jo     0xe1
  6e:	add    DWORD PTR [eax],eax
  70:	pop    es
  71:	sub    BYTE PTR [ebx+0x43],bl
  74:	dec    ecx
  75:	dec    ecx
  76:	sub    DWORD PTR [ecx+0x1],ecx
  79:	add    BYTE PTR [ebp*2+0x16e6961],al
  80:	add    BYTE PTR [esi],dl
  82:	sub    BYTE PTR [ebx+0x4c],bl
  85:	push   0x61
  87:	jbe    0xea
  89:	das    
  8a:	ins    BYTE PTR es:[edi],dx
  8b:	popa   
  8c:	outs   dx,BYTE PTR ds:[esi]
  8d:	addr16 das 
  8f:	push   ebx
  90:	je     0x104
  92:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  99:	add    BYTE PTR [edx],cl
  9b:	push   ebx
  9c:	outs   dx,DWORD PTR ds:[esi]
  9d:	jne    0x111
  9f:	arpl   WORD PTR [ebp+0x46],sp
  a2:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x46470800
  aa:	inc    edi
  ab:	cs push 0x61
  ae:	jbe    0x111
  b0:	or     al,0x0
  b2:	pop    es
  b3:	add    BYTE PTR [eax],cl
  b5:	or     al,0x0
  b7:	push   cs
  b8:	add    BYTE PTR [edi],cl
  ba:	or     al,0x0
  bc:	or     eax,DWORD PTR [eax]
  be:	or     al,0x1
  c0:	add    BYTE PTR ds:0x4b454547,cl
  c6:	push   ebx
  c7:	inc    esi
  c8:	dec    edi
  c9:	push   edx
  ca:	inc    edi
  cb:	inc    ebp
  cc:	inc    ebp
  cd:	dec    ebx
  ce:	push   ebx
  cf:	add    DWORD PTR [eax],eax
  d1:	add    eax,DWORD PTR [edi+0x46]
  d4:	inc    edi
  d5:	add    DWORD PTR [eax],eax
  d7:	adc    BYTE PTR [edx+0x61],ch
  da:	jbe    0x13d
  dc:	das    
  dd:	ins    BYTE PTR es:[edi],dx
  de:	popa   
  df:	outs   dx,BYTE PTR ds:[esi]
  e0:	addr16 das 
  e2:	dec    edi
  e3:	bound  ebp,QWORD PTR [edx+0x65]
  e6:	arpl   WORD PTR [eax+eax*1+0x20],si
  ea:	add    BYTE PTR ds:0x600,al
  f0:	add    BYTE PTR [eax],al
  f2:	add    BYTE PTR [eax+eax*1],al
  f5:	add    BYTE PTR [eax],al
  f7:	pop    es
  f8:	add    BYTE PTR [eax],cl
  fa:	add    BYTE PTR [ecx],al
  fc:	add    BYTE PTR [ecx],cl
  fe:	add    BYTE PTR [eax],al
 100:	add    BYTE PTR ds:0x1000100,bl
 106:	add    BYTE PTR [eax],al
 108:	add    BYTE PTR ds:0x100b72a,al
 10e:	mov    cl,0x0
 110:	add    BYTE PTR [eax],al
 112:	add    DWORD PTR [eax],eax
 114:	or     al,BYTE PTR [eax]
 116:	add    BYTE PTR [eax],al
 118:	push   es
 119:	add    BYTE PTR [ecx],al
 11b:	add    BYTE PTR [eax],al
 11d:	add    BYTE PTR [esi],al
 11f:	add    BYTE PTR [eax],cl
 121:	add    BYTE PTR [ebx],cl
 123:	add    BYTE PTR [eax+eax*1],cl
 126:	add    DWORD PTR [eax],eax
 128:	or     DWORD PTR [eax],eax
 12a:	add    BYTE PTR [eax],al
 12c:	add    BYTE PTR cs:[edx],al
 12f:	add    BYTE PTR [edx],al
 131:	add    BYTE PTR [eax],al
 133:	add    BYTE PTR [ebx],cl
 135:	sbb    bl,BYTE PTR [ebx]
 137:	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 138:	add    BYTE PTR [edi],al
 13a:	sbb    ah,BYTE PTR [edi-0x53e4fc00]
 140:	add    BYTE PTR [eax],al
 142:	add    BYTE PTR [edx],al
 144:	add    BYTE PTR [edx],cl
 146:	add    BYTE PTR [eax],al
 148:	add    BYTE PTR [esi],al
 14a:	add    BYTE PTR [ecx],al
 14c:	add    BYTE PTR [eax],al
 14e:	add    BYTE PTR [ecx],cl
 150:	add    BYTE PTR ds:0x5000000,cl
 156:	add    BYTE PTR [edx],al
 158:	or     DWORD PTR [eax+0x1],eax
 15b:	add    BYTE PTR [eax],cl
 15d:	add    BYTE PTR [esi],cl
 15f:	add    BYTE PTR [edi],cl
 161:	add    BYTE PTR [ecx],al
 163:	add    BYTE PTR [ecx],cl
 165:	add    BYTE PTR [eax],al
 167:	add    BYTE PTR [esi+0x0],bh
 16a:	add    al,0x0
 16c:	add    eax,DWORD PTR [eax]
 16e:	add    BYTE PTR [eax],al
 170:	inc    ebx
 171:	sbb    ebx,DWORD PTR [eax+eiz*4]
 174:	add    BYTE PTR ds:0x1b2aac04,al
 17a:	xor    al,0x2a
 17c:	sbb    al,0x34
 17e:	mov    al,ds:0x41b0c00
 183:	pusha  
 184:	sbb    al,0xa0
 186:	add    BYTE PTR ds:0x1b2aac05,al
 18c:	xor    al,0x2a
 18e:	sbb    al,0x34
 190:	mov    al,ds:0x1b2a1000
 195:	add    al,0x60
 197:	sbb    al,0x4
 199:	fs mov eax,0x60050200
 19f:	lods   al,BYTE PTR ds:[esi]
 1a0:	sub    bl,BYTE PTR [ebx]
 1a2:	sbb    al,0x4
 1a4:	fs mov eax,0x1b2a0200
 1aa:	add    al,0x60
 1ac:	sbb    al,0xb8
 1ae:	add    BYTE PTR [edx],al
 1b0:	mov    eax,0xac0300
 1b5:	add    BYTE PTR [eax],al
 1b7:	add    al,BYTE PTR [eax]
 1b9:	or     al,BYTE PTR [eax]
 1bb:	add    BYTE PTR [eax],al
 1bd:	push   ds
 1be:	add    BYTE PTR [edi],al
 1c0:	add    BYTE PTR [eax],al
 1c2:	add    BYTE PTR [eax],dl
 1c4:	add    BYTE PTR ds:0x7001100,al
 1ca:	add    BYTE PTR [esi],dl
 1cc:	add    BYTE PTR [edi],dl
 1ce:	add    BYTE PTR [edi],dl
 1d0:	add    BYTE PTR [ecx],bl
 1d2:	add    BYTE PTR [ebx],bl
 1d4:	add    BYTE PTR [edx],ah
 1d6:	add    BYTE PTR [eax+eax*1],bl
 1d9:	das    
 1da:	add    BYTE PTR [eax],ah
 1dc:	add    BYTE PTR ds:0x5000000,cl
 1e2:	add    BYTE PTR [ebx],al
 1e4:	pop    es
 1e5:	adc    DWORD PTR ds:0x10000900,edx
 1eb:	add    BYTE PTR [ecx],dl
 1ed:	add    BYTE PTR [ecx],al
 1ef:	add    BYTE PTR [ecx],cl
 1f1:	add    BYTE PTR [eax],al
 1f3:	add    BYTE PTR [edi],ah
 1f5:	add    BYTE PTR [ecx],al
 1f7:	add    BYTE PTR [ebx],al
 1f9:	add    BYTE PTR [eax],al
 1fb:	add    BYTE PTR [edi],al
 1fd:	adc    al,BYTE PTR [esp+ecx*2]
 200:	adc    BYTE PTR ds:0xb13d,cl
 206:	add    BYTE PTR [ecx],al
 208:	add    BYTE PTR [edx],cl
 20a:	add    BYTE PTR [eax],al
 20c:	add    BYTE PTR [esi],cl
 20e:	add    BYTE PTR [ebx],al
 210:	add    BYTE PTR [eax],al
 212:	add    BYTE PTR [esi],ah
 214:	add    BYTE PTR [ebx],al
 216:	add    BYTE PTR [edi],ah
 218:	add    BYTE PTR [esi],al
 21a:	add    BYTE PTR [ecx],ch
 21c:	add    BYTE PTR [ecx],al
 21e:	add    BYTE PTR [edx],dl
 220:	add    BYTE PTR [eax],al
 222:	add    BYTE PTR [edx],al
 224:	add    BYTE PTR [ebx],dl
