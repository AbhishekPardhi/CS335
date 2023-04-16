
DivideConquer.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [edi],dl
   a:	or     al,BYTE PTR [eax]
   c:	add    eax,0xa1200
  11:	add    al,0x0
  13:	adc    ecx,DWORD PTR [edx]
  15:	add    BYTE PTR [eax+eax*1],al
  18:	adc    al,0x7
  1a:	add    BYTE PTR ds:0x1160007,dl
  20:	add    BYTE PTR [esi],al
  22:	cmp    al,0x69
  24:	outs   dx,BYTE PTR ds:[esi]
  25:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  2d:	push   esi
  2e:	add    DWORD PTR [eax],eax
  30:	add    al,0x43
  32:	outs   dx,DWORD PTR ds:[esi]
  33:	fs add DWORD PTR gs:[eax],eax
  37:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  3b:	gs dec esi
  3d:	jne    0xac
  3f:	bound  esp,QWORD PTR [ebp+0x72]
  42:	push   esp
  43:	popa   
  44:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  48:	add    BYTE PTR [edi],al
  4a:	inc    esp
  4b:	inc    ecx
  4c:	inc    ebx
  4d:	pop    edi
  4e:	dec    ebp
  4f:	popa   
  50:	js     0x53
  52:	add    BYTE PTR [edi],al
  54:	sub    BYTE PTR [ebx+0x49],bl
  57:	dec    ecx
  58:	dec    ecx
  59:	sub    DWORD PTR [ecx+0x1],ecx
  5c:	add    BYTE PTR ds:0x63617453,cl
  62:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  66:	push   esp
  67:	popa   
  68:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  6c:	add    BYTE PTR [edi],al
  6e:	inc    esp
  6f:	inc    ecx
  70:	inc    ebx
  71:	pop    edi
  72:	dec    ebp
  73:	imul   ebp,DWORD PTR [esi+0x1],0x616d0400
  7a:	imul   ebp,DWORD PTR [esi+0x1],0x5b281600
  81:	dec    esp
  82:	push   0x61
  84:	jbe    0xe7
  86:	das    
  87:	ins    BYTE PTR es:[edi],dx
  88:	popa   
  89:	outs   dx,BYTE PTR ds:[esi]
  8a:	addr16 das 
  8c:	push   ebx
  8d:	je     0x101
  8f:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  96:	add    BYTE PTR [edx],cl
  98:	push   ebx
  99:	outs   dx,DWORD PTR ds:[esi]
  9a:	jne    0x10e
  9c:	arpl   WORD PTR [ebp+0x46],sp
  9f:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x69441200
  a7:	jbe    0x112
  a9:	fs gs inc ebx
  ac:	outs   dx,DWORD PTR ds:[esi]
  ad:	outs   dx,BYTE PTR ds:[esi]
  ae:	jno    0x125
  b0:	gs jb  0xe1
  b3:	push   0x61
  b5:	jbe    0x118
  b7:	or     al,0x0
  b9:	push   es
  ba:	add    BYTE PTR [edi],al
  bc:	or     al,0x0
  be:	or     al,BYTE PTR [eax]
  c0:	or     ecx,DWORD PTR [eax+eax*1]
  c3:	or     eax,0x10b00
  c8:	or     eax,0x69766944
  cd:	fs gs inc ebx
  d0:	outs   dx,DWORD PTR ds:[esi]
  d1:	outs   dx,BYTE PTR ds:[esi]
  d2:	jno    0x149
  d4:	gs jb  0xd8
  d7:	add    BYTE PTR [eax],dl
  d9:	push   0x61
  db:	jbe    0x13e
  dd:	das    
  de:	ins    BYTE PTR es:[edi],dx
  df:	popa   
  e0:	outs   dx,BYTE PTR ds:[esi]
  e1:	addr16 das 
  e3:	dec    edi
  e4:	bound  ebp,QWORD PTR [edx+0x65]
  e7:	arpl   WORD PTR [eax+eax*1+0x20],si
  eb:	add    BYTE PTR [eax+eax*1],al
  ee:	add    eax,0x0
  f3:	add    BYTE PTR [eax+eax*1],al
  f6:	add    BYTE PTR [eax],al
  f8:	push   es
  f9:	add    BYTE PTR [edi],al
  fb:	add    BYTE PTR [ecx],al
  fd:	add    BYTE PTR [eax],cl
  ff:	add    BYTE PTR [eax],al
 101:	add    BYTE PTR ds:0x1000100,bl
 107:	add    BYTE PTR [eax],al
 109:	add    BYTE PTR ds:0x100b72a,al
 10f:	mov    cl,0x0
 111:	add    BYTE PTR [eax],al
 113:	add    DWORD PTR [eax],eax
 115:	or     DWORD PTR [eax],eax
 117:	add    BYTE PTR [eax],al
 119:	push   es
 11a:	add    BYTE PTR [ecx],al
 11c:	add    BYTE PTR [eax],al
 11e:	add    BYTE PTR ds:0xa000800,al
 124:	add    BYTE PTR [ebx],cl
 126:	add    BYTE PTR [ecx],al
 128:	add    BYTE PTR [eax],cl
 12a:	add    BYTE PTR [eax],al
 12c:	add    BYTE PTR [edi+0x4000400],al
 132:	add    BYTE PTR [eax],al
 134:	add    BYTE PTR [esp+ebx*1],bh
 137:	add    al,0x64
 139:	call   0xac2e:0x1b2a0700
 140:	sbb    ebx,DWORD PTR [eax*1+0x1800a164]
 147:	sub    bl,BYTE PTR [ebx]
 149:	sub    bl,BYTE PTR cs:[ebx]
 14c:	add    al,0x60
 14e:	movs   BYTE PTR es:[edi],BYTE PTR cs:[esi]
 150:	add    BYTE PTR [edi],al
 152:	sub    bl,BYTE PTR [ebx]
 154:	lods   al,BYTE PTR cs:[esi]
 156:	sub    bl,BYTE PTR [ebx]
 158:	add    al,0x60
 15a:	lods   al,BYTE PTR cs:[esi]
 15c:	sub    bl,BYTE PTR [ebx]
 15e:	add    al,0x60
 160:	sbb    al,0xb8
 162:	add    BYTE PTR [edx],al
 164:	sub    bl,BYTE PTR ds:[ebx]
 167:	cs sbb eax,0x2a0700a4
 16d:	sbb    ebp,DWORD PTR [esi]
 16f:	lods   al,BYTE PTR ds:[esi]
 170:	sbb    eax,0xac
 175:	add    al,BYTE PTR [eax]
 177:	or     DWORD PTR [eax],eax
 179:	add    BYTE PTR [eax],al
 17b:	sub    al,BYTE PTR [eax]
 17d:	or     al,BYTE PTR [eax]
 17f:	add    BYTE PTR [eax],al
 181:	or     al,0x0
 183:	push   es
 184:	add    BYTE PTR [esi],cl
 186:	add    BYTE PTR [edx],cl
 188:	add    BYTE PTR [eax],dl
 18a:	add    BYTE PTR [ecx],dl
 18c:	add    BYTE PTR [edx],dl
 18e:	add    BYTE PTR [eax+eax*1],bl
 191:	adc    eax,DWORD PTR [eax]
 193:	and    BYTE PTR [eax],al
 195:	adc    eax,0x1a002600
 19a:	add    BYTE PTR [edi],ch
 19c:	add    BYTE PTR [eax+eax*1],bl
 19f:	add    BYTE PTR ss:0x1f003a00,bl
 1a6:	add    BYTE PTR [eax+eax*1],cl
 1a9:	add    BYTE PTR [eax],al
 1ab:	or     DWORD PTR [eax],eax
 1ad:	add    al,0xa
 1af:	adc    eax,0x1300fc05
 1b4:	add    DWORD PTR [eax],eax
 1b6:	or     BYTE PTR [eax],al
 1b8:	or     eax,0x1000b00
 1bd:	add    BYTE PTR [eax],cl
 1bf:	add    BYTE PTR [eax],al
 1c1:	add    BYTE PTR [edi+0x4000400],al
 1c7:	add    BYTE PTR [eax],al
 1c9:	add    BYTE PTR [esp+ebx*1],bh
 1cc:	add    al,0x64
 1ce:	call   0xac2e:0x1b2a0700
 1d5:	sbb    ebx,DWORD PTR [eax*1+0x1800a164]
 1dc:	sub    bl,BYTE PTR [ebx]
 1de:	sub    bl,BYTE PTR cs:[ebx]
 1e1:	add    al,0x60
 1e3:	mov    cs:0x1b2a0700,al
 1e9:	lods   al,BYTE PTR cs:[esi]
 1eb:	sub    bl,BYTE PTR [ebx]
 1ed:	add    al,0x60
 1ef:	lods   al,BYTE PTR cs:[esi]
 1f1:	sub    bl,BYTE PTR [ebx]
 1f3:	add    al,0x60
 1f5:	sbb    al,0xb8
 1f7:	add    BYTE PTR [ebx],al
 1f9:	sub    bl,BYTE PTR ds:[ebx]
 1fc:	cs sbb eax,0x2a0700a2
 202:	sbb    ebp,DWORD PTR [esi]
 204:	lods   al,BYTE PTR ds:[esi]
 205:	sbb    eax,0xac
 20a:	add    al,BYTE PTR [eax]
 20c:	or     DWORD PTR [eax],eax
 20e:	add    BYTE PTR [eax],al
 210:	sub    al,BYTE PTR [eax]
 212:	or     al,BYTE PTR [eax]
 214:	add    BYTE PTR [eax],al
 216:	daa    
 217:	add    BYTE PTR [esi],al
 219:	add    BYTE PTR [ecx],ch
 21b:	add    BYTE PTR [edx],cl
 21d:	add    BYTE PTR [ebx],ch
 21f:	add    BYTE PTR [ecx],dl
 221:	add    BYTE PTR ds:0x2e001c00,ch
 227:	add    BYTE PTR [eax],ah
 229:	add    BYTE PTR [eax],dh
 22b:	add    BYTE PTR [esi],ah
 22d:	add    BYTE PTR ds:0x37002f00,dh
 233:	add    BYTE PTR [esi],dh
 235:	add    BYTE PTR [eax],bh
 237:	add    BYTE PTR [edx],bh
 239:	add    BYTE PTR [edx],bh
 23b:	add    BYTE PTR [eax+eax*1],cl
 23e:	add    BYTE PTR [eax],al
 240:	or     DWORD PTR [eax],eax
 242:	add    al,0xa
 244:	adc    eax,0x1300fc05
 249:	add    DWORD PTR [eax],eax
 24b:	or     DWORD PTR [eax],eax
 24d:	push   cs
 24e:	add    BYTE PTR [edi],cl
 250:	add    BYTE PTR [ecx],al
 252:	add    BYTE PTR [eax],cl
 254:	add    BYTE PTR [eax],al
 256:	add    BYTE PTR [eax+eax*1+0x3],bh
 25a:	add    BYTE PTR [eax+eax*1],al
 25d:	add    BYTE PTR [eax],al
 25f:	cmp    al,0x10
 261:	pop    es
 262:	mov    esp,0x32d4e0a
 267:	adc    BYTE PTR [esi+0x4f],al
 26a:	sub    eax,0xfa001104
 26f:	dec    edi
 270:	sub    eax,0x4f321005
 275:	sub    eax,0x4f501006
 27a:	sub    eax,0x8c001107
 27f:	dec    edi
 280:	sub    eax,0x4f0c1008
 285:	sub    eax,0xe100610
 28a:	dec    edi
 28b:	sub    eax,0xb8071003
 290:	add    BYTE PTR [edx],al
 292:	cmp    eax,0x710032d
 297:	mov    eax,0xb13c0300
 29c:	add    BYTE PTR [eax],al
 29e:	add    BYTE PTR [ecx],al
 2a0:	add    BYTE PTR [ecx],cl
 2a2:	add    BYTE PTR [eax],al
 2a4:	add    BYTE PTR [esi],ch
 2a6:	add    BYTE PTR [ebx],cl
 2a8:	add    BYTE PTR [eax],al
 2aa:	add    BYTE PTR [ebp+0x0],al
 2ad:	add    eax,0xa004600
 2b2:	add    BYTE PTR [edi+0x0],al
 2b5:	adc    BYTE PTR [eax],al
 2b7:	dec    eax
 2b8:	add    BYTE PTR ds:0x1a004900,dl
 2be:	add    BYTE PTR [edx+0x0],cl
 2c1:	and    BYTE PTR [eax],al
 2c3:	dec    ebx
 2c4:	add    BYTE PTR ds:0x2b004c00,ah
 2ca:	add    BYTE PTR [edi+0x0],cl
 2cd:	xor    eax,DWORD PTR [eax]
 2cf:	push   edx
 2d0:	add    BYTE PTR [ebx],bh
 2d2:	add    BYTE PTR [eax+0x0],bl
 2d5:	add    DWORD PTR [eax],eax
 2d7:	adc    BYTE PTR [eax],al
 2d9:	add    BYTE PTR [eax],al
 2db:	add    al,BYTE PTR [eax]
 2dd:	.byte 0x11
