
ActivitySelection.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR ds:0x8000a,dh
   e:	adc    al,0x9
  10:	add    BYTE PTR ds:0x81600,dl
  16:	pop    ss
  17:	or     al,BYTE PTR [eax]
  19:	sbb    BYTE PTR [eax],al
  1b:	sbb    DWORD PTR [edx],edx
  1d:	add    BYTE PTR [eax],al
  1f:	add    BYTE PTR ds:0x7000a,bl
  25:	push   ds
  26:	pop    es
  27:	add    BYTE PTR [edi],bl
  29:	pop    es
  2a:	add    BYTE PTR [eax],ah
  2c:	add    DWORD PTR [eax],eax
  2e:	push   es
  2f:	cmp    al,0x69
  31:	outs   dx,BYTE PTR ds:[esi]
  32:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  3a:	push   esi
  3b:	add    DWORD PTR [eax],eax
  3d:	add    al,0x43
  3f:	outs   dx,DWORD PTR ds:[esi]
  40:	fs add DWORD PTR gs:[eax],eax
  44:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  48:	gs dec esi
  4a:	jne    0xb9
  4c:	bound  esp,QWORD PTR [ebp+0x72]
  4f:	push   esp
  50:	popa   
  51:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  55:	add    BYTE PTR [edx],dl
  57:	jo     0xcb
  59:	imul   ebp,DWORD PTR [esi+0x74],0x4178614d
  60:	arpl   WORD PTR [ecx+ebp*2+0x76],si
  64:	imul   esi,DWORD PTR [ecx+ebp*2+0x65],0x8000173
  6c:	sub    BYTE PTR [ebx+0x49],bl
  6f:	pop    ebx
  70:	dec    ecx
  71:	dec    ecx
  72:	sub    DWORD PTR [esi+0x1],edx
  75:	add    BYTE PTR ds:0x63617453,cl
  7b:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  7f:	push   esp
  80:	popa   
  81:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  85:	add    BYTE PTR [ebp*2+0x16e6961],al
  8c:	add    BYTE PTR [esi],dl
  8e:	sub    BYTE PTR [ebx+0x4c],bl
  91:	push   0x61
  93:	jbe    0xf6
  95:	das    
  96:	ins    BYTE PTR es:[edi],dx
  97:	popa   
  98:	outs   dx,BYTE PTR ds:[esi]
  99:	addr16 das 
  9b:	push   ebx
  9c:	je     0x110
  9e:	imul   ebp,DWORD PTR [esi+0x67],0x156293b
  a5:	add    BYTE PTR [edx],cl
  a7:	push   ebx
  a8:	outs   dx,DWORD PTR ds:[esi]
  a9:	jne    0x11d
  ab:	arpl   WORD PTR [ebp+0x46],sp
  ae:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x63411600
  b6:	je     0x121
  b8:	jbe    0x123
  ba:	je     0x135
  bc:	push   ebx
  bd:	gs ins BYTE PTR es:[edi],dx
  bf:	arpl   WORD PTR gs:[ecx+ebp*2+0x6f],si
  c4:	outs   dx,BYTE PTR ds:[esi]
  c5:	cs push 0x61
  c8:	jbe    0x12b
  ca:	or     al,0x0
  cc:	or     DWORD PTR [eax],eax
  ce:	or     al,BYTE PTR [edi]
  d0:	add    BYTE PTR [ecx],ah
  d2:	or     al,0x0
  d4:	and    al,BYTE PTR [eax]
  d6:	and    eax,DWORD PTR [ecx]
  d8:	add    BYTE PTR [ecx],ah
  da:	inc    esi
  db:	outs   dx,DWORD PTR ds:[esi]
  dc:	ins    BYTE PTR es:[edi],dx
  dd:	ins    BYTE PTR es:[edi],dx
  de:	outs   dx,DWORD PTR ds:[esi]
  df:	ja     0x14a
  e1:	outs   dx,BYTE PTR ds:[esi]
  e2:	and    BYTE PTR [bx+di+0x63],ah
  e6:	je     0x151
  e8:	jbe    0x153
  ea:	je     0x155
  ec:	gs jae 0x10f
  ef:	popa   
  f0:	jb     0x157
  f2:	and    BYTE PTR [ebx+0x65],dh
  f5:	ins    BYTE PTR es:[edi],dx
  f6:	arpl   WORD PTR gs:[ebp+eiz*2+0x64],si
  fb:	pop    es
  fc:	add    BYTE PTR [esp+ecx*1],ah
  ff:	add    BYTE PTR ds:0x12600,ah
 105:	adc    BYTE PTR [edx+0x6f],al
 108:	outs   dx,DWORD PTR ds:[esi]
 109:	je     0x17e
 10b:	je     0x17f
 10d:	popa   
 10e:	jo     0x15d
 110:	gs je  0x17b
 113:	outs   dx,DWORD PTR ds:[esi]
 114:	fs jae 0x126
 117:	push   es
 118:	add    BYTE PTR [edi],ah
 11a:	or     BYTE PTR [eax],al
 11c:	sub    BYTE PTR [eax+eax*1],cl
 11f:	sub    DWORD PTR [eax],eax
 121:	sub    cl,BYTE PTR [eax+eax*1]
 124:	or     eax,0x10e00
 129:	adc    DWORD PTR [ecx+0x63],eax
 12c:	je     0x197
 12e:	jbe    0x199
 130:	je     0x1ab
 132:	push   ebx
 133:	gs ins BYTE PTR es:[edi],dx
 135:	arpl   WORD PTR gs:[ecx+ebp*2+0x6f],si
 13a:	outs   dx,BYTE PTR ds:[esi]
 13b:	add    DWORD PTR [eax],eax
 13d:	adc    BYTE PTR [edx+0x61],ch
 140:	jbe    0x1a3
 142:	das    
 143:	ins    BYTE PTR es:[edi],dx
 144:	popa   
 145:	outs   dx,BYTE PTR ds:[esi]
 146:	addr16 das 
 148:	dec    edi
 149:	bound  ebp,QWORD PTR [edx+0x65]
 14c:	arpl   WORD PTR [ecx+eax*1+0x0],si
 150:	adc    BYTE PTR [edx+0x61],ch
 153:	jbe    0x1b6
 155:	das    
 156:	ins    BYTE PTR es:[edi],dx
 157:	popa   
 158:	outs   dx,BYTE PTR ds:[esi]
 159:	addr16 das 
 15b:	push   ebx
 15c:	jns    0x1d1
 15e:	je     0x1c5
 160:	ins    DWORD PTR es:[edi],dx
 161:	add    DWORD PTR [eax],eax
 163:	add    ebp,DWORD PTR [edi+0x75]
 166:	je     0x169
 168:	add    BYTE PTR ds:0x76616a4c,dl
 16e:	popa   
 16f:	das    
 170:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 177:	je     0x1cc
 179:	je     0x1ed
 17b:	gs popa 
 17d:	ins    DWORD PTR es:[edi],dx
 17e:	cmp    eax,DWORD PTR [ecx]
 180:	add    BYTE PTR [ebx],dl
 182:	push   0x61
 184:	jbe    0x1e7
 186:	das    
 187:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 18e:	je     0x1e3
 190:	je     0x204
 192:	gs popa 
 194:	ins    DWORD PTR es:[edi],dx
 195:	add    DWORD PTR [eax],eax
 197:	pop    es
 198:	jo     0x20c
 19a:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 1a1:	adc    eax,0x616a4c28
 1a6:	jbe    0x209
 1a8:	das    
 1a9:	ins    BYTE PTR es:[edi],dx
 1aa:	popa   
 1ab:	outs   dx,BYTE PTR ds:[esi]
 1ac:	addr16 das 
 1ae:	push   ebx
 1af:	je     0x223
 1b1:	imul   ebp,DWORD PTR [esi+0x67],0xa56293b
 1b8:	add    BYTE PTR [ebx],ch
 1ba:	add    BYTE PTR [ecx+eax*1],ch
 1bd:	add    BYTE PTR [edx],al
 1bf:	add    DWORD PTR [eax],esp
 1c1:	add    DWORD PTR [eax],eax
 1c3:	pop    ss
 1c4:	ins    DWORD PTR es:[edi],dx
 1c5:	popa   
 1c6:	imul   esp,DWORD PTR [ebp+0x43],0x6f
 1ca:	outs   dx,BYTE PTR ds:[esi]
 1cb:	arpl   WORD PTR [ecx+0x74],sp
 1ce:	push   edi
 1cf:	imul   esi,DWORD PTR [eax+ebp*2+0x43],0x74736e6f
 1d7:	popa   
 1d8:	outs   dx,BYTE PTR ds:[esi]
 1d9:	je     0x24e
 1db:	add    DWORD PTR [eax],eax
 1dd:	adc    eax,0x4c294928
 1e2:	push   0x61
 1e4:	jbe    0x247
 1e6:	das    
 1e7:	ins    BYTE PTR es:[edi],dx
 1e8:	popa   
 1e9:	outs   dx,BYTE PTR ds:[esi]
 1ea:	addr16 das 
 1ec:	push   ebx
 1ed:	je     0x261
 1ef:	imul   ebp,DWORD PTR [esi+0x67],0x2d00073b
 1f6:	or     al,0x0
 1f8:	sub    DWORD PTR [eax],eax
 1fa:	xor    DWORD PTR [ecx],eax
 1fc:	add    BYTE PTR [edx+ebp*2],ah
 1ff:	popa   
 200:	jbe    0x263
 202:	das    
 203:	ins    BYTE PTR es:[edi],dx
 204:	popa   
 205:	outs   dx,BYTE PTR ds:[esi]
 206:	addr16 das 
 208:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 20f:	push   ebx
 210:	je     0x284
 212:	imul   ebp,DWORD PTR [esi+0x67],0x636e6f43
 219:	popa   
 21a:	je     0x262
 21c:	popa   
 21d:	arpl   WORD PTR [edi+ebp*2+0x72],si
 221:	jns    0x22a
 223:	add    BYTE PTR [ebx],dh
 225:	add    DWORD PTR [eax],eax
 227:	push   es
 228:	dec    esp
 229:	outs   dx,DWORD PTR ds:[esi]
 22a:	outs   dx,DWORD PTR ds:[esi]
 22b:	imul   esi,DWORD PTR [ebp+0x70],0x1
 22f:	add    BYTE PTR [ecx+ecx*2],cl
 232:	outs   dx,BYTE PTR ds:[esi]
 233:	outs   dx,BYTE PTR ds:[esi]
 234:	gs jb  0x27a
 237:	ins    BYTE PTR es:[edi],dx
 238:	popa   
 239:	jae    0x2ae
 23b:	gs jae 0x23f
 23e:	add    BYTE PTR [eax+0x616a4c28],bl
 244:	jbe    0x2a7
 246:	das    
 247:	ins    BYTE PTR es:[edi],dx
 248:	popa   
 249:	outs   dx,BYTE PTR ds:[esi]
 24a:	addr16 das 
 24c:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 253:	dec    ebp
 254:	gs je  0x2bf
 257:	outs   dx,DWORD PTR ds:[esi]
 258:	fs dec eax
 25a:	popa   
 25b:	outs   dx,BYTE PTR ds:[esi]
 25c:	fs ins BYTE PTR es:[edi],dx
 25e:	gs jae 0x285
 261:	dec    esp
 262:	outs   dx,DWORD PTR ds:[esi]
 263:	outs   dx,DWORD PTR ds:[esi]
 264:	imul   esi,DWORD PTR [ebp+0x70],0x3b
 268:	dec    esp
 269:	push   0x61
 26b:	jbe    0x2ce
 26d:	das    
 26e:	ins    BYTE PTR es:[edi],dx
 26f:	popa   
 270:	outs   dx,BYTE PTR ds:[esi]
 271:	addr16 das 
 273:	push   ebx
 274:	je     0x2e8
 276:	imul   ebp,DWORD PTR [esi+0x67],0x616a4c3b
 27d:	jbe    0x2e0
 27f:	das    
 280:	ins    BYTE PTR es:[edi],dx
 281:	popa   
 282:	outs   dx,BYTE PTR ds:[esi]
 283:	addr16 das 
 285:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 28c:	dec    ebp
 28d:	gs je  0x2f8
 290:	outs   dx,DWORD PTR ds:[esi]
 291:	fs push esp
 293:	jns    0x305
 295:	cmp    ecx,DWORD PTR gs:[edx+ebp*2+0x61]
 29a:	jbe    0x2fd
 29c:	das    
 29d:	ins    BYTE PTR es:[edi],dx
 29e:	popa   
 29f:	outs   dx,BYTE PTR ds:[esi]
 2a0:	addr16 das 
 2a2:	push   ebx
 2a3:	je     0x317
 2a5:	imul   ebp,DWORD PTR [esi+0x67],0x6a4c5b3b
 2ac:	popa   
 2ad:	jbe    0x310
 2af:	das    
 2b0:	ins    BYTE PTR es:[edi],dx
 2b1:	popa   
 2b2:	outs   dx,BYTE PTR ds:[esi]
 2b3:	addr16 das 
 2b5:	dec    edi
 2b6:	bound  ebp,QWORD PTR [edx+0x65]
 2b9:	arpl   WORD PTR [ebx+edi*1+0x29],si
 2bd:	dec    esp
 2be:	push   0x61
 2c0:	jbe    0x323
 2c2:	das    
 2c3:	ins    BYTE PTR es:[edi],dx
 2c4:	popa   
 2c5:	outs   dx,BYTE PTR ds:[esi]
 2c6:	addr16 das 
 2c8:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2cf:	inc    ebx
 2d0:	popa   
 2d1:	ins    BYTE PTR es:[edi],dx
 2d2:	ins    BYTE PTR es:[edi],dx
 2d3:	push   ebx
 2d4:	imul   esi,DWORD PTR [ebp+eiz*2+0x3b],0x1340007
 2dc:	add    BYTE PTR ds:0x6176616a,ah
 2e2:	das    
 2e3:	ins    BYTE PTR es:[edi],dx
 2e4:	popa   
 2e5:	outs   dx,BYTE PTR ds:[esi]
 2e6:	addr16 das 
 2e8:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2ef:	dec    ebp
 2f0:	gs je  0x35b
 2f3:	outs   dx,DWORD PTR ds:[esi]
 2f4:	fs dec eax
 2f6:	popa   
 2f7:	outs   dx,BYTE PTR ds:[esi]
 2f8:	fs ins BYTE PTR es:[edi],dx
 2fa:	gs jae 0x321
 2fd:	dec    esp
 2fe:	outs   dx,DWORD PTR ds:[esi]
 2ff:	outs   dx,DWORD PTR ds:[esi]
 300:	imul   esi,DWORD PTR [ebp+0x70],0x1
 304:	add    BYTE PTR [esi],bl
 306:	push   0x61
 308:	jbe    0x36b
 30a:	das    
 30b:	ins    BYTE PTR es:[edi],dx
 30c:	popa   
 30d:	outs   dx,BYTE PTR ds:[esi]
 30e:	addr16 das 
 310:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 317:	dec    ebp
 318:	gs je  0x383
 31b:	outs   dx,DWORD PTR ds:[esi]
 31c:	fs dec eax
 31e:	popa   
 31f:	outs   dx,BYTE PTR ds:[esi]
 320:	fs ins BYTE PTR es:[edi],dx
 322:	gs jae 0x325
 325:	and    BYTE PTR [eax],al
 327:	pop    es
 328:	add    BYTE PTR [eax],cl
 32a:	add    BYTE PTR [eax],al
 32c:	add    BYTE PTR [eax],al
 32e:	add    BYTE PTR [ebx],al
 330:	add    BYTE PTR [eax],al
 332:	add    BYTE PTR [ecx],cl
 334:	add    BYTE PTR [edx],cl
 336:	add    BYTE PTR [ecx],al
 338:	add    BYTE PTR [ebx],cl
 33a:	add    BYTE PTR [eax],al
 33c:	add    BYTE PTR ds:0x1000100,bl
 342:	add    BYTE PTR [eax],al
 344:	add    BYTE PTR ds:0x100b72a,al
 34a:	mov    cl,0x0
 34c:	add    BYTE PTR [eax],al
 34e:	add    DWORD PTR [eax],eax
 350:	or     al,0x0
 352:	add    BYTE PTR [eax],al
 354:	push   es
 355:	add    BYTE PTR [ecx],al
 357:	add    BYTE PTR [eax],al
 359:	add    BYTE PTR [edx],cl
 35b:	add    BYTE PTR [ecx],cl
 35d:	add    BYTE PTR ds:0x1000e00,cl
 363:	add    BYTE PTR [ebx],cl
 365:	add    BYTE PTR [eax],al
 367:	add    BYTE PTR [edi+0x5000300],al
 36d:	add    BYTE PTR [eax],al
 36f:	add    BYTE PTR [eax-0x4e],al
 372:	add    BYTE PTR [edx],al
 374:	adc    al,BYTE PTR [ebx]
 376:	mov    dh,0x0
 378:	add    al,0x3
 37a:	ds mov dl,0x0
 37d:	add    bl,BYTE PTR ds:0x500ba
 383:	add    BYTE PTR [esi+0x36040400],dh
 389:	add    al,0x15
 38b:	add    al,0x1c
 38d:	mov    ds:0x152a2300,al
 392:	add    al,0x2e
 394:	sub    ebx,DWORD PTR ds:0x1300a12e
 39a:	mov    dl,0x0
 39c:	add    dl,BYTE PTR ds:0x500ba04
 3a2:	add    BYTE PTR [eax],al
 3a4:	mov    dh,0x0
 3a6:	add    al,0x15
 3a8:	add    al,0x3e
 3aa:	test   BYTE PTR [ecx+eax*1],al
 3ad:	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 3ae:	(bad)  
 3af:	fnsave [ecx+0x2000000]
 3b5:	add    BYTE PTR [eax+eax*1],cl
 3b8:	add    BYTE PTR [eax],al
 3ba:	add    BYTE PTR es:[ecx],cl
 3bd:	add    BYTE PTR [eax],al
 3bf:	add    BYTE PTR [edx],dl
 3c1:	add    BYTE PTR [eax],cl
 3c3:	add    BYTE PTR [esi],dl
 3c5:	add    BYTE PTR [edx],cl
 3c7:	add    BYTE PTR [edi],dl
 3c9:	add    BYTE PTR [esi],dl
 3cb:	add    BYTE PTR [edx],bl
 3cd:	add    BYTE PTR [edi],bl
 3cf:	add    BYTE PTR [esi],bl
 3d1:	add    BYTE PTR [ecx],ch
 3d3:	add    BYTE PTR [edi],bl
 3d5:	add    BYTE PTR [esi],dh
 3d7:	add    BYTE PTR [eax],ah
 3d9:	add    BYTE PTR [ecx],bh
 3db:	add    BYTE PTR [edx],bl
 3dd:	add    BYTE PTR [edi],bh
 3df:	add    BYTE PTR [ebx],ah
 3e1:	add    BYTE PTR [edi],cl
 3e3:	add    BYTE PTR [eax],al
 3e5:	add    BYTE PTR [ecx],cl
 3e7:	add    BYTE PTR [ebx],al
 3e9:	std    
 3ea:	add    BYTE PTR [ecx],bl
 3ec:	add    DWORD PTR [ecx],eax
 3ee:	pop    ds
 3ef:	add    eax,0x10000900
 3f4:	add    BYTE PTR [ecx],dl
 3f6:	add    BYTE PTR [ecx],al
 3f8:	add    BYTE PTR [ebx],cl
 3fa:	add    BYTE PTR [eax],al
 3fc:	add    BYTE PTR [ecx+0x4000300],ah
 402:	add    BYTE PTR [eax],al
 404:	add    BYTE PTR [ecx+0x10],cl
 407:	push   es
 408:	mov    esp,0x32b4c0a
 40d:	add    al,0x4f
 40f:	sub    eax,DWORD PTR [esi+eax*1]
 412:	dec    edi
 413:	sub    eax,DWORD PTR ds:0x62b4f03
 419:	or     BYTE PTR [edi+0x2b],cl
 41c:	pop    es
 41d:	adc    BYTE PTR [eax],cl
 41f:	dec    edi
 420:	sub    ecx,DWORD PTR [eax]
 422:	or     BYTE PTR [edi+0x10],cl
 425:	push   es
 426:	mov    esp,0x32c4d0a
 42b:	add    eax,0x7042c4f
 430:	dec    edi
 431:	sub    al,0x5
 433:	adc    BYTE PTR [esi],al
 435:	dec    edi
 436:	sub    al,0x6
 438:	adc    BYTE PTR [edi],al
 43a:	dec    edi
 43b:	sub    al,0x7
 43d:	adc    BYTE PTR [ecx],cl
 43f:	dec    edi
 440:	sub    al,0x8
 442:	adc    BYTE PTR [ecx],cl
 444:	dec    edi
 445:	adc    BYTE PTR [esi],al
 447:	sub    ebp,DWORD PTR ds:[ebx*1-0x4ef9ff48]
 44f:	add    BYTE PTR [eax],al
 451:	add    BYTE PTR [ecx],al
 453:	add    BYTE PTR [eax+eax*1],cl
 456:	add    BYTE PTR [eax],al
 458:	inc    esi
 459:	add    BYTE PTR [ecx],dl
 45b:	add    BYTE PTR [eax],al
 45d:	add    BYTE PTR [eax],ch
 45f:	add    BYTE PTR ds:0x9002900,al
 465:	add    BYTE PTR [edx],ch
 467:	add    BYTE PTR ds:0x11002b00,cl
 46d:	add    BYTE PTR [eax+eax*1],ch
 470:	adc    eax,0x1a002d00
 475:	add    BYTE PTR [esi],ch
 477:	add    BYTE PTR [esi],bl
 479:	add    BYTE PTR [edi],ch
 47b:	add    BYTE PTR [ebx],ah
 47d:	add    BYTE PTR [eax],dh
 47f:	add    BYTE PTR [edi],ah
 481:	add    BYTE PTR [ecx],dh
 483:	add    BYTE PTR [ebx],ch
 485:	add    BYTE PTR [edx],dh
 487:	add    BYTE PTR [eax],dh
 489:	add    BYTE PTR [ebx],dh
 48b:	add    BYTE PTR ds:0x3a003400,dh
 491:	add    BYTE PTR ds:0x37003f00,dh
 497:	add    BYTE PTR [edx+0x0],al
 49a:	cmp    al,BYTE PTR [eax]
 49c:	dec    eax
 49d:	add    BYTE PTR [ebx],bh
 49f:	add    BYTE PTR [ebx],al
 4a1:	add    BYTE PTR [edx],dl
 4a3:	add    BYTE PTR [eax],al
 4a5:	add    BYTE PTR [edx],al
 4a7:	add    BYTE PTR [ebx],dl
 4a9:	add    BYTE PTR [eax],dh
 4ab:	add    BYTE PTR [eax],al
 4ad:	add    BYTE PTR [edx],cl
 4af:	add    BYTE PTR [ecx],al
 4b1:	add    BYTE PTR [esi],ch
 4b3:	add    BYTE PTR [edx],dh
 4b5:	add    BYTE PTR [edi],ch
 4b7:	add    BYTE PTR [ecx],bl
 4b9:	add    BYTE PTR [edx],bl
 4bb:	add    BYTE PTR [eax],al
 4bd:	add    BYTE PTR [eax],cl
 4bf:	add    BYTE PTR [ecx],al
 4c1:	add    BYTE PTR [ebx],bl
 4c3:	add    BYTE PTR [ecx],al
 4c5:	.byte 0x0
 4c6:	.byte 0x1c
