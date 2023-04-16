
LIS.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [edx+ecx*1],bh
   b:	add    BYTE PTR [ecx],cl
   d:	add    BYTE PTR [ecx],bl
   f:	or     al,BYTE PTR [eax]
  11:	or     BYTE PTR [eax],al
  13:	sbb    cl,BYTE PTR [ecx]
  15:	add    BYTE PTR [eax],cl
  17:	add    BYTE PTR [ebx],bl
  19:	or     DWORD PTR [eax],eax
  1b:	sbb    al,0x0
  1d:	sbb    eax,0x8000a
  22:	push   ds
  23:	adc    al,BYTE PTR [eax]
  25:	add    BYTE PTR [eax],al
  27:	and    cl,BYTE PTR [edx]
  29:	add    BYTE PTR [ebx],ah
  2b:	add    BYTE PTR [edi+eax*1],ah
  2e:	add    BYTE PTR ds:0x1260007,ah
  34:	add    BYTE PTR [edi],al
  36:	ins    DWORD PTR es:[edi],dx
  37:	popa   
  38:	js     0x99
  3a:	jb     0xa1
  3c:	add    WORD PTR [eax],ax
  3f:	add    DWORD PTR [ecx+0x1],ecx
  42:	add    BYTE PTR [esi],al
  44:	cmp    al,0x69
  46:	outs   dx,BYTE PTR ds:[esi]
  47:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  4f:	push   esi
  50:	add    DWORD PTR [eax],eax
  52:	add    al,0x43
  54:	outs   dx,DWORD PTR ds:[esi]
  55:	fs add DWORD PTR gs:[eax],eax
  59:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  5d:	gs dec esi
  5f:	jne    0xce
  61:	bound  esp,QWORD PTR [ebp+0x72]
  64:	push   esp
  65:	popa   
  66:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  6a:	add    BYTE PTR [edi+ebx*2],al
  6d:	ins    BYTE PTR es:[edi],dx
  6e:	imul   esi,DWORD PTR [ebx+0x1],0x5b280600
  75:	dec    ecx
  76:	dec    ecx
  77:	sub    DWORD PTR [ecx+0x1],ecx
  7a:	add    BYTE PTR ds:0x63617453,cl
  80:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  84:	push   esp
  85:	popa   
  86:	bound  ebp,QWORD PTR [ebp+eiz*2+0x7]
  8a:	add    BYTE PTR [edi],ah
  8c:	add    DWORD PTR [eax],eax
  8e:	add    ebp,DWORD PTR [ecx+ebp*2+0x73]
  92:	add    DWORD PTR [eax],eax
  94:	add    al,0x6d
  96:	popa   
  97:	imul   ebp,DWORD PTR [esi+0x1],0x5b281600
  9e:	dec    esp
  9f:	push   0x61
  a1:	jbe    0x104
  a3:	das    
  a4:	ins    BYTE PTR es:[edi],dx
  a5:	popa   
  a6:	outs   dx,BYTE PTR ds:[esi]
  a7:	addr16 das 
  a9:	push   ebx
  aa:	je     0x11e
  ac:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  b3:	add    BYTE PTR [edx],cl
  b5:	push   ebx
  b6:	outs   dx,DWORD PTR ds:[esi]
  b7:	jne    0x12b
  b9:	arpl   WORD PTR [ebp+0x46],sp
  bc:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x494c0800
  c4:	push   ebx
  c5:	cs push 0x61
  c8:	jbe    0x12b
  ca:	or     al,0x0
  cc:	or     al,0x0
  ce:	or     eax,0x10000c
  d3:	adc    DWORD PTR [eax+eax*1],ecx
  d6:	or     al,BYTE PTR [eax]
  d8:	or     eax,DWORD PTR [edi]
  da:	add    BYTE PTR [eax],ch
  dc:	or     al,0x0
  de:	sub    DWORD PTR [eax],eax
  e0:	sub    cl,BYTE PTR [eax+eax*1]
  e3:	adc    al,0x0
  e5:	adc    DWORD PTR [ecx],eax
  e7:	add    BYTE PTR [eax],dl
  e9:	inc    edx
  ea:	outs   dx,DWORD PTR ds:[esi]
  eb:	outs   dx,DWORD PTR ds:[esi]
  ec:	je     0x161
  ee:	je     0x162
  f0:	popa   
  f1:	jo     0x140
  f3:	gs je  0x15e
  f6:	outs   dx,DWORD PTR ds:[esi]
  f7:	fs jae 0x109
  fa:	push   es
  fb:	add    BYTE PTR [ebx],ch
  fd:	or     BYTE PTR [eax],al
  ff:	sub    al,0xc
 101:	add    BYTE PTR ds:0x72e00,ch
 107:	das    
 108:	or     al,0x0
 10a:	xor    BYTE PTR [eax],al
 10c:	xor    DWORD PTR [ecx],eax
 10e:	add    BYTE PTR [ebx],al
 110:	dec    esp
 111:	dec    ecx
 112:	push   ebx
 113:	add    DWORD PTR [eax],eax
 115:	adc    BYTE PTR [edx+0x61],ch
 118:	jbe    0x17b
 11a:	das    
 11b:	ins    BYTE PTR es:[edi],dx
 11c:	popa   
 11d:	outs   dx,BYTE PTR ds:[esi]
 11e:	addr16 das 
 120:	dec    edi
 121:	bound  ebp,QWORD PTR [edx+0x65]
 124:	arpl   WORD PTR [ecx+eax*1+0x0],si
 128:	add    bl,BYTE PTR [ebx+0x49]
 12b:	add    DWORD PTR [eax],eax
 12d:	adc    BYTE PTR [edx+0x61],ch
 130:	jbe    0x193
 132:	das    
 133:	ins    BYTE PTR es:[edi],dx
 134:	popa   
 135:	outs   dx,BYTE PTR ds:[esi]
 136:	addr16 das 
 138:	push   ebx
 139:	jns    0x1ae
 13b:	je     0x1a2
 13d:	ins    DWORD PTR es:[edi],dx
 13e:	add    DWORD PTR [eax],eax
 140:	add    ebp,DWORD PTR [edi+0x75]
 143:	je     0x146
 145:	add    BYTE PTR ds:0x76616a4c,dl
 14b:	popa   
 14c:	das    
 14d:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 154:	je     0x1a9
 156:	je     0x1ca
 158:	gs popa 
 15a:	ins    DWORD PTR es:[edi],dx
 15b:	cmp    ecx,DWORD PTR [edx]
 15d:	add    BYTE PTR [edx],dh
 15f:	add    BYTE PTR [ebx],dh
 161:	add    DWORD PTR [eax],eax
 163:	adc    cl,BYTE PTR [ebp+eiz*2+0x6e]
 167:	addr16 je 0x1d2
 16a:	and    BYTE PTR [edi+0x66],ch
 16d:	and    BYTE PTR [ecx+ebp*2+0x73],ch
 171:	and    BYTE PTR [ecx+0x73],ch
 174:	and    BYTE PTR [ecx],al
 176:	add    DWORD PTR [eax],eax
 178:	pop    ss
 179:	ins    DWORD PTR es:[edi],dx
 17a:	popa   
 17b:	imul   esp,DWORD PTR [ebp+0x43],0x6f
 17f:	outs   dx,BYTE PTR ds:[esi]
 180:	arpl   WORD PTR [ecx+0x74],sp
 183:	push   edi
 184:	imul   esi,DWORD PTR [eax+ebp*2+0x43],0x74736e6f
 18c:	popa   
 18d:	outs   dx,BYTE PTR ds:[esi]
 18e:	je     0x203
 190:	add    DWORD PTR [eax],eax
 192:	adc    eax,0x4c294928
 197:	push   0x61
 199:	jbe    0x1fc
 19b:	das    
 19c:	ins    BYTE PTR es:[edi],dx
 19d:	popa   
 19e:	outs   dx,BYTE PTR ds:[esi]
 19f:	addr16 das 
 1a1:	push   ebx
 1a2:	je     0x216
 1a4:	imul   ebp,DWORD PTR [esi+0x67],0x1300013b
 1ab:	push   0x61
 1ad:	jbe    0x210
 1af:	das    
 1b0:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 1b7:	je     0x20c
 1b9:	je     0x22d
 1bb:	gs popa 
 1bd:	ins    DWORD PTR es:[edi],dx
 1be:	add    DWORD PTR [eax],eax
 1c0:	pop    es
 1c1:	jo     0x235
 1c3:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 1ca:	adc    eax,0x616a4c28
 1cf:	jbe    0x232
 1d1:	das    
 1d2:	ins    BYTE PTR es:[edi],dx
 1d3:	popa   
 1d4:	outs   dx,BYTE PTR ds:[esi]
 1d5:	addr16 das 
 1d7:	push   ebx
 1d8:	je     0x24c
 1da:	imul   ebp,DWORD PTR [esi+0x67],0x756293b
 1e1:	add    BYTE PTR [esp+ecx*1],dh
 1e4:	add    BYTE PTR ds:0x13800,ch
 1ea:	and    al,0x6a
 1ec:	popa   
 1ed:	jbe    0x250
 1ef:	das    
 1f0:	ins    BYTE PTR es:[edi],dx
 1f1:	popa   
 1f2:	outs   dx,BYTE PTR ds:[esi]
 1f3:	addr16 das 
 1f5:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 1fc:	push   ebx
 1fd:	je     0x271
 1ff:	imul   ebp,DWORD PTR [esi+0x67],0x636e6f43
 206:	popa   
 207:	je     0x24f
 209:	popa   
 20a:	arpl   WORD PTR [edi+ebp*2+0x72],si
 20e:	jns    0x217
 210:	add    BYTE PTR [edx],bh
 212:	add    DWORD PTR [eax],eax
 214:	push   es
 215:	dec    esp
 216:	outs   dx,DWORD PTR ds:[esi]
 217:	outs   dx,DWORD PTR ds:[esi]
 218:	imul   esi,DWORD PTR [ebp+0x70],0x1
 21c:	add    BYTE PTR [ecx+ecx*2],cl
 21f:	outs   dx,BYTE PTR ds:[esi]
 220:	outs   dx,BYTE PTR ds:[esi]
 221:	gs jb  0x267
 224:	ins    BYTE PTR es:[edi],dx
 225:	popa   
 226:	jae    0x29b
 228:	gs jae 0x22c
 22b:	add    BYTE PTR [eax+0x616a4c28],bl
 231:	jbe    0x294
 233:	das    
 234:	ins    BYTE PTR es:[edi],dx
 235:	popa   
 236:	outs   dx,BYTE PTR ds:[esi]
 237:	addr16 das 
 239:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 240:	dec    ebp
 241:	gs je  0x2ac
 244:	outs   dx,DWORD PTR ds:[esi]
 245:	fs dec eax
 247:	popa   
 248:	outs   dx,BYTE PTR ds:[esi]
 249:	fs ins BYTE PTR es:[edi],dx
 24b:	gs jae 0x272
 24e:	dec    esp
 24f:	outs   dx,DWORD PTR ds:[esi]
 250:	outs   dx,DWORD PTR ds:[esi]
 251:	imul   esi,DWORD PTR [ebp+0x70],0x3b
 255:	dec    esp
 256:	push   0x61
 258:	jbe    0x2bb
 25a:	das    
 25b:	ins    BYTE PTR es:[edi],dx
 25c:	popa   
 25d:	outs   dx,BYTE PTR ds:[esi]
 25e:	addr16 das 
 260:	push   ebx
 261:	je     0x2d5
 263:	imul   ebp,DWORD PTR [esi+0x67],0x616a4c3b
 26a:	jbe    0x2cd
 26c:	das    
 26d:	ins    BYTE PTR es:[edi],dx
 26e:	popa   
 26f:	outs   dx,BYTE PTR ds:[esi]
 270:	addr16 das 
 272:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 279:	dec    ebp
 27a:	gs je  0x2e5
 27d:	outs   dx,DWORD PTR ds:[esi]
 27e:	fs push esp
 280:	jns    0x2f2
 282:	cmp    ecx,DWORD PTR gs:[edx+ebp*2+0x61]
 287:	jbe    0x2ea
 289:	das    
 28a:	ins    BYTE PTR es:[edi],dx
 28b:	popa   
 28c:	outs   dx,BYTE PTR ds:[esi]
 28d:	addr16 das 
 28f:	push   ebx
 290:	je     0x304
 292:	imul   ebp,DWORD PTR [esi+0x67],0x6a4c5b3b
 299:	popa   
 29a:	jbe    0x2fd
 29c:	das    
 29d:	ins    BYTE PTR es:[edi],dx
 29e:	popa   
 29f:	outs   dx,BYTE PTR ds:[esi]
 2a0:	addr16 das 
 2a2:	dec    edi
 2a3:	bound  ebp,QWORD PTR [edx+0x65]
 2a6:	arpl   WORD PTR [ebx+edi*1+0x29],si
 2aa:	dec    esp
 2ab:	push   0x61
 2ad:	jbe    0x310
 2af:	das    
 2b0:	ins    BYTE PTR es:[edi],dx
 2b1:	popa   
 2b2:	outs   dx,BYTE PTR ds:[esi]
 2b3:	addr16 das 
 2b5:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2bc:	inc    ebx
 2bd:	popa   
 2be:	ins    BYTE PTR es:[edi],dx
 2bf:	ins    BYTE PTR es:[edi],dx
 2c0:	push   ebx
 2c1:	imul   esi,DWORD PTR [ebp+eiz*2+0x3b],0x13b0007
 2c9:	add    BYTE PTR ds:0x6176616a,ah
 2cf:	das    
 2d0:	ins    BYTE PTR es:[edi],dx
 2d1:	popa   
 2d2:	outs   dx,BYTE PTR ds:[esi]
 2d3:	addr16 das 
 2d5:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2dc:	dec    ebp
 2dd:	gs je  0x348
 2e0:	outs   dx,DWORD PTR ds:[esi]
 2e1:	fs dec eax
 2e3:	popa   
 2e4:	outs   dx,BYTE PTR ds:[esi]
 2e5:	fs ins BYTE PTR es:[edi],dx
 2e7:	gs jae 0x30e
 2ea:	dec    esp
 2eb:	outs   dx,DWORD PTR ds:[esi]
 2ec:	outs   dx,DWORD PTR ds:[esi]
 2ed:	imul   esi,DWORD PTR [ebp+0x70],0x1
 2f1:	add    BYTE PTR [esi],bl
 2f3:	push   0x61
 2f5:	jbe    0x358
 2f7:	das    
 2f8:	ins    BYTE PTR es:[edi],dx
 2f9:	popa   
 2fa:	outs   dx,BYTE PTR ds:[esi]
 2fb:	addr16 das 
 2fd:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 304:	dec    ebp
 305:	gs je  0x370
 308:	outs   dx,DWORD PTR ds:[esi]
 309:	fs dec eax
 30b:	popa   
 30c:	outs   dx,BYTE PTR ds:[esi]
 30d:	fs ins BYTE PTR es:[edi],dx
 30f:	gs jae 0x312
 312:	and    BYTE PTR [eax],al
 314:	or     BYTE PTR [eax],al
 316:	or     DWORD PTR [eax],eax
 318:	add    BYTE PTR [eax],al
 31a:	add    DWORD PTR [eax],eax
 31c:	or     BYTE PTR [eax],al
 31e:	or     al,BYTE PTR [eax]
 320:	or     eax,DWORD PTR [eax]
 322:	add    BYTE PTR [eax],al
 324:	add    al,0x0
 326:	add    BYTE PTR [eax],al
 328:	or     al,0x0
 32a:	or     eax,0xe000100
 32f:	add    BYTE PTR [eax],al
 331:	add    BYTE PTR ds:0x1000100,bl
 337:	add    BYTE PTR [eax],al
 339:	add    BYTE PTR ds:0x100b72a,al
 33f:	mov    cl,0x0
 341:	add    BYTE PTR [eax],al
 343:	add    DWORD PTR [eax],eax
 345:	sldt   WORD PTR [eax]
 348:	add    BYTE PTR [esi],al
 34a:	add    BYTE PTR [ecx],al
 34c:	add    BYTE PTR [eax],al
 34e:	add    BYTE PTR [esi],al
 350:	add    BYTE PTR [eax],cl
 352:	add    BYTE PTR [eax],dl
 354:	add    BYTE PTR [ecx],dl
 356:	add    BYTE PTR [ecx],al
 358:	add    BYTE PTR [esi],cl
 35a:	add    BYTE PTR [eax],al
 35c:	add    BYTE PTR [eax+0x5000400],dh
 362:	add    BYTE PTR [eax],al
 364:	add    BYTE PTR [ebp+0x1b],al
 367:	add    al,0xa0
 369:	add    BYTE PTR ds:0x3e04ac04,al
 36f:	add    al,0x36
 371:	add    al,0x15
 373:	add    al,0x1b
 375:	mov    ds:0x152a2900,al
 37a:	add    al,0xb8
 37c:	add    BYTE PTR [edx],al
 37e:	cmp    eax,0x404152a
 383:	fs sub bl,BYTE PTR cs:[ebx]
 387:	add    al,0x64
 389:	mov    cs:0x41c0e00,al
 38f:	pusha  
 390:	sbb    eax,0x1c0700a4
 395:	add    al,0x60
 397:	test   BYTE PTR ds:[ecx+eax*1],al
 39b:	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 39c:	call   edi
 39e:	mov    dl,0x0
 3a0:	add    ebx,DWORD PTR ds:0x1d0700a2
 3a6:	mov    bl,0x0
 3a8:	add    ebx,DWORD PTR ds:0xac
 3ae:	add    al,BYTE PTR [eax]
 3b0:	sldt   WORD PTR [eax]
 3b3:	add    BYTE PTR [esi],ch
 3b5:	add    BYTE PTR [ebx],cl
 3b7:	add    BYTE PTR [eax],al
 3b9:	add    BYTE PTR ds:0x16000500,dl
 3bf:	add    BYTE PTR [edi],al
 3c1:	add    BYTE PTR [edx],bl
 3c3:	add    BYTE PTR [ecx],cl
 3c5:	add    BYTE PTR [eax],ah
 3c7:	add    BYTE PTR [edx],dl
 3c9:	add    BYTE PTR [ecx],ah
 3cb:	add    BYTE PTR [ecx],bl
 3cd:	add    BYTE PTR [edx],ah
 3cf:	add    BYTE PTR [esi],ch
 3d1:	add    BYTE PTR [eax+eax*1],ah
 3d4:	xor    al,BYTE PTR [eax]
 3d6:	and    BYTE PTR [eax],al
 3d8:	cmp    BYTE PTR [eax],al
 3da:	sub    DWORD PTR [eax],eax
 3dc:	aas    
 3dd:	add    BYTE PTR [edx],ch
 3df:	add    BYTE PTR [ebx+0x0],al
 3e2:	sub    eax,0x1200
 3e7:	add    BYTE PTR ds:0xfe070500,ah
 3ed:	add    BYTE PTR [eax+eax*1],al
 3f0:	add    DWORD PTR [ecx],eax
 3f2:	inc    DWORD PTR [eax]
 3f4:	and    eax,0x70500
 3f9:	adc    eax,DWORD PTR [ecx]
 3fb:	add    DWORD PTR [ecx],eax
 3fd:	add    DWORD PTR [eax],eax
 3ff:	add    bh,bh
 401:	add    BYTE PTR ds:0x70400,al
 407:	adc    eax,DWORD PTR [ecx]
 409:	add    BYTE PTR [ecx],al
 40b:	add    BYTE PTR [eax],al
 40d:	or     al,BYTE PTR [eax]
 40f:	or     BYTE PTR [eax],al
 411:	adc    al,0x0
 413:	adc    DWORD PTR [eax],eax
 415:	add    DWORD PTR [eax],eax
 417:	push   cs
 418:	add    BYTE PTR [eax],al
 41a:	add    BYTE PTR [esi],ch
 41c:	add    BYTE PTR [edx],al
 41e:	add    BYTE PTR [edx],al
 420:	add    BYTE PTR [eax],al
 422:	add    BYTE PTR [esi],cl
 424:	add    al,0xb3
 426:	add    BYTE PTR [ebx],al
 428:	sub    bl,BYTE PTR [ebx]
 42a:	mov    eax,0xb2570200
 42f:	add    BYTE PTR [ebx],al
 431:	lods   al,BYTE PTR ds:[esi]
 432:	add    BYTE PTR [eax],al
 434:	add    BYTE PTR [ecx],al
 436:	add    BYTE PTR [edi],cl
 438:	add    BYTE PTR [eax],al
 43a:	add    BYTE PTR [esi],cl
 43c:	add    BYTE PTR [ebx],al
 43e:	add    BYTE PTR [eax],al
 440:	add    BYTE PTR [eax+eax*1],dh
 443:	add    al,0x0
 445:	aaa    
 446:	add    BYTE PTR [edx],cl
 448:	add    BYTE PTR [edx],bh
 44a:	add    BYTE PTR [ecx],cl
 44c:	add    BYTE PTR ds:0x1001600,dl
 452:	add    BYTE PTR [esi],cl
 454:	add    BYTE PTR [eax],al
 456:	add    BYTE PTR [edi+0x3000300],cl
 45c:	add    BYTE PTR [eax],al
 45e:	add    BYTE PTR [ebx+0x10],al
 461:	or     BYTE PTR [edx+ecx*1+0x10032b4c],bh
 468:	or     cl,BYTE PTR [edi+0x2b]
 46b:	add    al,0x10
 46d:	push   ss
 46e:	dec    edi
 46f:	sub    eax,DWORD PTR ds:0x2b4f0910
 475:	push   es
 476:	adc    BYTE PTR [ecx],ah
 478:	dec    edi
 479:	sub    eax,DWORD PTR [edi]
 47b:	adc    BYTE PTR ds:0x10082b4f,dl
 481:	xor    cl,BYTE PTR [edi+0x2b]
 484:	adc    BYTE PTR [esi],al
 486:	adc    BYTE PTR [ecx],ch
 488:	dec    edi
 489:	sub    edx,DWORD PTR [eax]
 48b:	pop    es
 48c:	adc    BYTE PTR [edi+ecx*2],bh
 48f:	adc    BYTE PTR [eax],cl
 491:	cmp    eax,0x2b0400b2
 496:	sbb    al,0xb8
 498:	add    BYTE PTR ds:0x600ba,al
 49e:	add    BYTE PTR [esi+0xb10700],dh
 4a4:	add    BYTE PTR [eax],al
 4a6:	add    DWORD PTR [eax],eax
 4a8:	sldt   WORD PTR [eax]
 4ab:	add    BYTE PTR [edx],bh
 4ad:	add    BYTE PTR [esi],cl
 4af:	add    BYTE PTR [eax],al
 4b1:	add    BYTE PTR [eax+0x0],al
 4b4:	add    eax,0xa004100
 4b9:	add    BYTE PTR [edx+0x0],al
 4bc:	sldt   WORD PTR [ebx+0x0]
 4c0:	adc    al,0x0
 4c2:	inc    esp
 4c3:	add    BYTE PTR [ecx],bl
 4c5:	add    BYTE PTR [ebp+0x0],al
 4c8:	push   ds
 4c9:	add    BYTE PTR [esi+0x0],al
 4cc:	and    eax,DWORD PTR [eax]
 4ce:	inc    edi
 4cf:	add    BYTE PTR [ecx],ch
 4d1:	add    BYTE PTR [eax+0x0],cl
 4d4:	das    
 4d5:	add    BYTE PTR [edx+0x0],cl
 4d8:	xor    al,BYTE PTR [eax]
 4da:	dec    ebp
 4db:	add    BYTE PTR [edi],dh
 4dd:	add    BYTE PTR [esi+0x0],cl
 4e0:	aas    
 4e1:	add    BYTE PTR [ebp+0x0],cl
 4e4:	inc    edx
 4e5:	add    BYTE PTR [edi+0x0],cl
 4e8:	add    eax,DWORD PTR [eax]
 4ea:	pop    ss
 4eb:	add    BYTE PTR [eax],al
 4ed:	add    BYTE PTR [edx],al
 4ef:	add    BYTE PTR [eax],bl
 4f1:	add    BYTE PTR [edi],dh
 4f3:	add    BYTE PTR [eax],al
 4f5:	add    BYTE PTR [edx],cl
 4f7:	add    BYTE PTR [ecx],al
 4f9:	add    BYTE PTR ds:0x36003900,dh
 4ff:	add    BYTE PTR [ecx],bl
 501:	add    BYTE PTR [edi],bl
 503:	add    BYTE PTR [eax],al
 505:	add    BYTE PTR [eax],cl
 507:	add    BYTE PTR [ecx],al
 509:	add    BYTE PTR [eax],ah
 50b:	add    BYTE PTR [ecx],al
 50d:	add    BYTE PTR [ecx],ah
