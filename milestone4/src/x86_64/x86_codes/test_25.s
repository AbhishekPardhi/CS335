
test_25.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [edi],bl
   a:	or     al,BYTE PTR [eax]
   c:	pop    es
   d:	add    BYTE PTR [ecx],dl
   f:	add    al,0x41
  11:	nop
  12:	add    BYTE PTR [eax],al
  14:	or     DWORD PTR [eax],eax
  16:	adc    al,BYTE PTR [eax]
  18:	adc    ecx,DWORD PTR [eax]
  1a:	add    BYTE PTR [edx+ecx*1],dl
  1d:	add    BYTE PTR ds:0x71600,dl
  23:	pop    ss
  24:	pop    es
  25:	add    BYTE PTR [eax],bl
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
  50:	add    BYTE PTR [ebp*2+0x16e6961],al
  57:	add    BYTE PTR [esi],dl
  59:	sub    BYTE PTR [ebx+0x4c],bl
  5c:	push   0x61
  5e:	jbe    0xc1
  60:	das    
  61:	ins    BYTE PTR es:[edi],dx
  62:	popa   
  63:	outs   dx,BYTE PTR ds:[esi]
  64:	addr16 das 
  66:	push   ebx
  67:	je     0xdb
  69:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  70:	add    BYTE PTR ds:0x63617453,cl
  76:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  7a:	push   esp
  7b:	popa   
  7c:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  80:	add    BYTE PTR [edx],cl
  82:	push   ebx
  83:	outs   dx,DWORD PTR ds:[esi]
  84:	jne    0xf8
  86:	arpl   WORD PTR [ebp+0x46],sp
  89:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x65740c00
  91:	jae    0x107
  93:	pop    edi
  94:	xor    dh,BYTE PTR ds:0x76616a2e
  9a:	popa   
  9b:	or     al,0x0
  9d:	or     BYTE PTR [eax],al
  9f:	or     DWORD PTR [edi],eax
  a1:	add    BYTE PTR [ecx],bl
  a3:	or     al,0x0
  a5:	sbb    al,BYTE PTR [eax]
  a7:	sbb    eax,DWORD PTR [ecx]
  a9:	add    BYTE PTR [ebx],dl
  ab:	js     0xcd
  ad:	imul   esi,DWORD PTR [ebx+0x20],0x61657267
  b4:	je     0x11b
  b6:	jb     0xd8
  b8:	je     0x122
  ba:	popa   
  bb:	outs   dx,BYTE PTR ds:[esi]
  bc:	and    BYTE PTR [ecx+0x7],bh
  bf:	add    BYTE PTR [esp+ecx*1],bl
  c2:	add    BYTE PTR ds:0x11e00,bl
  c8:	pop    es
  c9:	je     0x130
  cb:	jae    0x141
  cd:	pop    edi
  ce:	xor    dh,BYTE PTR ds:0x6a100001
  d4:	popa   
  d5:	jbe    0x138
  d7:	das    
  d8:	ins    BYTE PTR es:[edi],dx
  d9:	popa   
  da:	outs   dx,BYTE PTR ds:[esi]
  db:	addr16 das 
  dd:	dec    edi
  de:	bound  ebp,QWORD PTR [edx+0x65]
  e1:	arpl   WORD PTR [ecx+eax*1+0x0],si
  e5:	adc    BYTE PTR [edx+0x61],ch
  e8:	jbe    0x14b
  ea:	das    
  eb:	ins    BYTE PTR es:[edi],dx
  ec:	popa   
  ed:	outs   dx,BYTE PTR ds:[esi]
  ee:	addr16 das 
  f0:	push   ebx
  f1:	jns    0x166
  f3:	je     0x15a
  f5:	ins    DWORD PTR es:[edi],dx
  f6:	add    DWORD PTR [eax],eax
  f8:	add    ebp,DWORD PTR [edi+0x75]
  fb:	je     0xfe
  fd:	add    BYTE PTR ds:0x76616a4c,dl
 103:	popa   
 104:	das    
 105:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 10c:	je     0x161
 10e:	je     0x182
 110:	gs popa 
 112:	ins    DWORD PTR es:[edi],dx
 113:	cmp    eax,DWORD PTR [ecx]
 115:	add    BYTE PTR [ebx],dl
 117:	push   0x61
 119:	jbe    0x17c
 11b:	das    
 11c:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 123:	je     0x178
 125:	je     0x199
 127:	gs popa 
 129:	ins    DWORD PTR es:[edi],dx
 12a:	add    DWORD PTR [eax],eax
 12c:	pop    es
 12d:	jo     0x1a1
 12f:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 136:	adc    eax,0x616a4c28
 13b:	jbe    0x19e
 13d:	das    
 13e:	ins    BYTE PTR es:[edi],dx
 13f:	popa   
 140:	outs   dx,BYTE PTR ds:[esi]
 141:	addr16 das 
 143:	push   ebx
 144:	je     0x1b8
 146:	imul   ebp,DWORD PTR [esi+0x67],0x56293b
 14d:	and    BYTE PTR [eax],al
 14f:	push   es
 150:	add    BYTE PTR [edi],al
 152:	add    BYTE PTR [eax],al
 154:	add    BYTE PTR [eax],al
 156:	add    BYTE PTR [edx],al
 158:	add    BYTE PTR [eax],al
 15a:	add    BYTE PTR [eax],cl
 15c:	add    BYTE PTR [ecx],cl
 15e:	add    BYTE PTR [ecx],al
 160:	add    BYTE PTR [edx],cl
 162:	add    BYTE PTR [eax],al
 164:	add    BYTE PTR ds:0x1000100,bl
 16a:	add    BYTE PTR [eax],al
 16c:	add    BYTE PTR ds:0x100b72a,al
 172:	mov    cl,0x0
 174:	add    BYTE PTR [eax],al
 176:	add    DWORD PTR [eax],eax
 178:	or     eax,DWORD PTR [eax]
 17a:	add    BYTE PTR [eax],al
 17c:	push   es
 17d:	add    BYTE PTR [ecx],al
 17f:	add    BYTE PTR [eax],al
 181:	add    BYTE PTR [ebx],al
 183:	add    BYTE PTR [ecx],cl
 185:	add    BYTE PTR [eax+eax*1],cl
 188:	or     eax,0xa000100
 18d:	add    BYTE PTR [eax],al
 18f:	add    BYTE PTR [ebx+0x4000200],ah
 195:	add    BYTE PTR [eax],al
 197:	add    BYTE PTR [ecx+0x10],al
 19a:	adc    al,0x3c
 19c:	adc    al,BYTE PTR [edx]
 19e:	inc    ebp
 19f:	sbb    eax,DWORD PTR [esi+0x9e9524]
 1a5:	or     esi,DWORD PTR [edx+0x4120300]
 1ab:	mov    dh,0x0
 1ad:	add    eax,0x101d3e03
 1b2:	or     ah,BYTE PTR [edx+0x1840c00]
 1b8:	add    DWORD PTR [ebx+eax*1-0xb0058ff],eax
 1bf:	sbb    edx,DWORD PTR [eax]
 1c1:	or     ah,BYTE PTR [edx+0x1841700]
 1c7:	add    DWORD PTR [ebx],ebx
 1c9:	or     BYTE PTR [eax+0x1840900],ah
 1cf:	add    ah,BYTE PTR [edi+0x184efff]
 1d5:	add    DWORD PTR [edi+0xb1e9ff],esp
 1db:	add    BYTE PTR [eax],al
 1dd:	add    al,BYTE PTR [eax]
 1df:	or     eax,DWORD PTR [eax]
 1e1:	add    BYTE PTR [eax],al
 1e3:	cmp    al,BYTE PTR [eax]
 1e5:	push   cs
 1e6:	add    BYTE PTR [eax],al
 1e8:	add    BYTE PTR [edi],al
 1ea:	add    BYTE PTR [ebx],al
 1ec:	add    BYTE PTR [eax],cl
 1ee:	add    BYTE PTR [esi],al
 1f0:	add    BYTE PTR [ecx],cl
 1f2:	add    BYTE PTR ds:0x15000a00,cl
 1f8:	add    BYTE PTR ds:0xe001d00,cl
 1fe:	add    BYTE PTR [eax],ah
 200:	add    BYTE PTR ds:0x13002600,cl
 206:	add    BYTE PTR [eax+eax*1],ch
 209:	adc    al,0x0
 20b:	das    
 20c:	add    BYTE PTR ds:0x16003400,dl
 212:	add    BYTE PTR [edi],dh
 214:	add    BYTE PTR [edi],dl
 216:	add    BYTE PTR [edx],bh
 218:	add    BYTE PTR [ecx],bl
 21a:	add    BYTE PTR [eax+0x0],al
 21d:	sbb    eax,DWORD PTR [eax]
 21f:	push   cs
 220:	add    BYTE PTR [eax],al
 222:	add    BYTE PTR [eax],dl
 224:	add    BYTE PTR ds:0x11500fd,al
 22a:	add    bh,ah
 22c:	add    BYTE PTR [ecx],al
 22e:	add    edx,edi
 230:	add    BYTE PTR [esi],cl
 232:	adc    eax,DWORD PTR ds:0xf000100
 238:	add    BYTE PTR [eax],al
 23a:	add    BYTE PTR [edx],al
 23c:	add    BYTE PTR [eax],dl
