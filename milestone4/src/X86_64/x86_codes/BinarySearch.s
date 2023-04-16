
BinarySearch.class:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	retf   0xbafe
   3:	mov    esi,0x37000000
   8:	add    BYTE PTR [edx],bh
   a:	or     al,BYTE PTR [eax]
   c:	or     DWORD PTR [eax],eax
   e:	pop    ss
   f:	or     al,BYTE PTR [eax]
  11:	add    eax,DWORD PTR [eax]
  13:	sbb    BYTE PTR [edi],al
  15:	add    BYTE PTR [ecx],bl
  17:	or     al,BYTE PTR [eax]
  19:	add    eax,DWORD PTR [eax]
  1b:	pop    ss
  1c:	or     DWORD PTR [eax],eax
  1e:	sbb    al,BYTE PTR [eax]
  20:	sbb    ecx,DWORD PTR [eax]
  22:	add    BYTE PTR [edx+ecx*1],bl
  25:	add    BYTE PTR ds:0x121e00,bl
  2b:	add    BYTE PTR [eax],al
  2d:	and    al,BYTE PTR [edi]
  2f:	add    BYTE PTR [ebx],ah
  31:	add    DWORD PTR [eax],eax
  33:	push   es
  34:	cmp    al,0x69
  36:	outs   dx,BYTE PTR ds:[esi]
  37:	imul   esi,DWORD PTR [esi+edi*1+0x1],0x29280300
  3f:	push   esi
  40:	add    DWORD PTR [eax],eax
  42:	add    al,0x43
  44:	outs   dx,DWORD PTR ds:[esi]
  45:	fs add DWORD PTR gs:[eax],eax
  49:	cmovl  ebp,DWORD PTR [ecx+0x6e]
  4d:	gs dec esi
  4f:	jne    0xbe
  51:	bound  esp,QWORD PTR [ebp+0x72]
  54:	push   esp
  55:	popa   
  56:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  5a:	add    BYTE PTR [edx+eiz*2],cl
  5d:	imul   ebp,DWORD PTR [esi+0x61],0x65537972
  64:	popa   
  65:	jb     0xca
  67:	push   0x28080001
  6c:	pop    ebx
  6d:	dec    ecx
  6e:	dec    ecx
  6f:	dec    ecx
  70:	dec    ecx
  71:	sub    DWORD PTR [ecx+0x1],ecx
  74:	add    BYTE PTR ds:0x63617453,cl
  7a:	imul   ecx,DWORD PTR [ebp+0x61],0x70
  7e:	push   esp
  7f:	popa   
  80:	bound  ebp,QWORD PTR [ebp+eiz*2+0x1]
  84:	add    BYTE PTR [ebp*2+0x16e6961],al
  8b:	add    BYTE PTR [esi],dl
  8d:	sub    BYTE PTR [ebx+0x4c],bl
  90:	push   0x61
  92:	jbe    0xf5
  94:	das    
  95:	ins    BYTE PTR es:[edi],dx
  96:	popa   
  97:	outs   dx,BYTE PTR ds:[esi]
  98:	addr16 das 
  9a:	push   ebx
  9b:	je     0x10f
  9d:	imul   ebp,DWORD PTR [esi+0x67],0x756293b
  a4:	add    BYTE PTR [edi+eax*1],ah
  a7:	add    BYTE PTR ds:0x530a0001,ah
  ad:	outs   dx,DWORD PTR ds:[esi]
  ae:	jne    0x122
  b0:	arpl   WORD PTR [ebp+0x46],sp
  b3:	imul   ebp,DWORD PTR [ebp+eiz*2+0x1],0x69421100
  bb:	outs   dx,BYTE PTR ds:[esi]
  bc:	popa   
  bd:	jb     0x138
  bf:	push   ebx
  c0:	gs popa 
  c2:	jb     0x127
  c4:	push   0x76616a2e
  c9:	popa   
  ca:	or     al,0x0
  cc:	or     al,BYTE PTR [eax]
  ce:	or     ecx,DWORD PTR [eax+eax*1]
  d1:	push   cs
  d2:	add    BYTE PTR [edi],cl
  d4:	add    DWORD PTR [eax],eax
  d6:	or     al,0x42
  d8:	imul   ebp,DWORD PTR [esi+0x61],0x65537972
  df:	popa   
  e0:	jb     0x145
  e2:	push   0xc260007
  e7:	add    BYTE PTR [edi],ah
  e9:	add    BYTE PTR [eax],ch
  eb:	add    DWORD PTR [eax],eax
  ed:	adc    eax,DWORD PTR [ebp+0x6c]
  f0:	gs ins DWORD PTR es:[edi],dx
  f2:	outs   dx,BYTE PTR gs:[esi]
  f4:	je     0x116
  f6:	outs   dx,BYTE PTR ds:[esi]
  f7:	outs   dx,DWORD PTR ds:[esi]
  f8:	je     0x11a
  fa:	jo     0x16e
  fc:	gs jae 0x164
  ff:	outs   dx,BYTE PTR ds:[esi]
 100:	je     0x109
 102:	add    BYTE PTR [ecx],ch
 104:	or     al,0x0
 106:	sub    al,BYTE PTR [eax]
 108:	sub    eax,DWORD PTR [ecx]
 10a:	add    BYTE PTR [eax],dl
 10c:	inc    edx
 10d:	outs   dx,DWORD PTR ds:[esi]
 10e:	outs   dx,DWORD PTR ds:[esi]
 10f:	je     0x184
 111:	je     0x185
 113:	popa   
 114:	jo     0x163
 116:	gs je  0x181
 119:	outs   dx,DWORD PTR ds:[esi]
 11a:	fs jae 0x12c
 11d:	push   es
 11e:	add    BYTE PTR [eax+ecx*1],ch
 121:	add    BYTE PTR ds:0x2e000c,ch
 127:	das    
 128:	add    DWORD PTR [eax],eax
 12a:	adc    BYTE PTR [edx+0x61],ch
 12d:	jbe    0x190
 12f:	das    
 130:	ins    BYTE PTR es:[edi],dx
 131:	popa   
 132:	outs   dx,BYTE PTR ds:[esi]
 133:	addr16 das 
 135:	dec    edi
 136:	bound  ebp,QWORD PTR [edx+0x65]
 139:	arpl   WORD PTR [ecx+eax*1+0x0],si
 13d:	adc    ebx,DWORD PTR [ebx+0x4c]
 140:	push   0x61
 142:	jbe    0x1a5
 144:	das    
 145:	ins    BYTE PTR es:[edi],dx
 146:	popa   
 147:	outs   dx,BYTE PTR ds:[esi]
 148:	addr16 das 
 14a:	push   ebx
 14b:	je     0x1bf
 14d:	imul   ebp,DWORD PTR [esi+0x67],0x200013b
 154:	pop    ebx
 155:	dec    ecx
 156:	add    DWORD PTR [eax],eax
 158:	adc    BYTE PTR [edx+0x61],ch
 15b:	jbe    0x1be
 15d:	das    
 15e:	ins    BYTE PTR es:[edi],dx
 15f:	popa   
 160:	outs   dx,BYTE PTR ds:[esi]
 161:	addr16 das 
 163:	push   ebx
 164:	jns    0x1d9
 166:	je     0x1cd
 168:	ins    DWORD PTR es:[edi],dx
 169:	add    DWORD PTR [eax],eax
 16b:	add    ebp,DWORD PTR [edi+0x75]
 16e:	je     0x171
 170:	add    BYTE PTR ds:0x76616a4c,dl
 176:	popa   
 177:	das    
 178:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 17f:	je     0x1d4
 181:	je     0x1f5
 183:	gs popa 
 185:	ins    DWORD PTR es:[edi],dx
 186:	cmp    eax,DWORD PTR [ecx]
 188:	add    BYTE PTR [ebx],dl
 18a:	push   0x61
 18c:	jbe    0x1ef
 18e:	das    
 18f:	imul   ebp,DWORD PTR [edi+0x2f],0x6e697250
 196:	je     0x1eb
 198:	je     0x20c
 19a:	gs popa 
 19c:	ins    DWORD PTR es:[edi],dx
 19d:	add    DWORD PTR [eax],eax
 19f:	pop    es
 1a0:	jo     0x214
 1a2:	imul   ebp,DWORD PTR [esi+0x74],0x16e6c
 1a9:	adc    eax,0x616a4c28
 1ae:	jbe    0x211
 1b0:	das    
 1b1:	ins    BYTE PTR es:[edi],dx
 1b2:	popa   
 1b3:	outs   dx,BYTE PTR ds:[esi]
 1b4:	addr16 das 
 1b6:	push   ebx
 1b7:	je     0x22b
 1b9:	imul   ebp,DWORD PTR [esi+0x67],0xa56293b
 1c0:	add    BYTE PTR [eax],dh
 1c2:	add    BYTE PTR [ecx],dh
 1c4:	add    DWORD PTR [eax],eax
 1c6:	sbb    BYTE PTR [ebp+0x6c],al
 1c9:	gs ins DWORD PTR es:[edi],dx
 1cb:	outs   dx,BYTE PTR gs:[esi]
 1cd:	je     0x1ef
 1cf:	outs   dx,WORD PTR ds:[esi]
 1d1:	jne    0x241
 1d3:	and    BYTE PTR fs:[ecx+0x74],ah
 1d7:	and    BYTE PTR [ecx+0x6e],ch
 1da:	fs gs js 0x1fe
 1de:	add    DWORD PTR [ecx],eax
 1e0:	add    BYTE PTR [edi],dl
 1e2:	ins    DWORD PTR es:[edi],dx
 1e3:	popa   
 1e4:	imul   esp,DWORD PTR [ebp+0x43],0x6f
 1e8:	outs   dx,BYTE PTR ds:[esi]
 1e9:	arpl   WORD PTR [ecx+0x74],sp
 1ec:	push   edi
 1ed:	imul   esi,DWORD PTR [eax+ebp*2+0x43],0x74736e6f
 1f5:	popa   
 1f6:	outs   dx,BYTE PTR ds:[esi]
 1f7:	je     0x26c
 1f9:	add    DWORD PTR [eax],eax
 1fb:	adc    eax,0x4c294928
 200:	push   0x61
 202:	jbe    0x265
 204:	das    
 205:	ins    BYTE PTR es:[edi],dx
 206:	popa   
 207:	outs   dx,BYTE PTR ds:[esi]
 208:	addr16 das 
 20a:	push   ebx
 20b:	je     0x27f
 20d:	imul   ebp,DWORD PTR [esi+0x67],0x3200073b
 214:	or     al,0x0
 216:	add    BYTE PTR cs:[esi],dh
 219:	add    DWORD PTR [eax],eax
 21b:	and    al,0x6a
 21d:	popa   
 21e:	jbe    0x281
 220:	das    
 221:	ins    BYTE PTR es:[edi],dx
 222:	popa   
 223:	outs   dx,BYTE PTR ds:[esi]
 224:	addr16 das 
 226:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 22d:	push   ebx
 22e:	je     0x2a2
 230:	imul   ebp,DWORD PTR [esi+0x67],0x636e6f43
 237:	popa   
 238:	je     0x280
 23a:	popa   
 23b:	arpl   WORD PTR [edi+ebp*2+0x72],si
 23f:	jns    0x248
 241:	add    BYTE PTR [eax],bh
 243:	add    DWORD PTR [eax],eax
 245:	push   es
 246:	dec    esp
 247:	outs   dx,DWORD PTR ds:[esi]
 248:	outs   dx,DWORD PTR ds:[esi]
 249:	imul   esi,DWORD PTR [ebp+0x70],0x1
 24d:	add    BYTE PTR [ecx+ecx*2],cl
 250:	outs   dx,BYTE PTR ds:[esi]
 251:	outs   dx,BYTE PTR ds:[esi]
 252:	gs jb  0x298
 255:	ins    BYTE PTR es:[edi],dx
 256:	popa   
 257:	jae    0x2cc
 259:	gs jae 0x25d
 25c:	add    BYTE PTR [eax+0x616a4c28],bl
 262:	jbe    0x2c5
 264:	das    
 265:	ins    BYTE PTR es:[edi],dx
 266:	popa   
 267:	outs   dx,BYTE PTR ds:[esi]
 268:	addr16 das 
 26a:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 271:	dec    ebp
 272:	gs je  0x2dd
 275:	outs   dx,DWORD PTR ds:[esi]
 276:	fs dec eax
 278:	popa   
 279:	outs   dx,BYTE PTR ds:[esi]
 27a:	fs ins BYTE PTR es:[edi],dx
 27c:	gs jae 0x2a3
 27f:	dec    esp
 280:	outs   dx,DWORD PTR ds:[esi]
 281:	outs   dx,DWORD PTR ds:[esi]
 282:	imul   esi,DWORD PTR [ebp+0x70],0x3b
 286:	dec    esp
 287:	push   0x61
 289:	jbe    0x2ec
 28b:	das    
 28c:	ins    BYTE PTR es:[edi],dx
 28d:	popa   
 28e:	outs   dx,BYTE PTR ds:[esi]
 28f:	addr16 das 
 291:	push   ebx
 292:	je     0x306
 294:	imul   ebp,DWORD PTR [esi+0x67],0x616a4c3b
 29b:	jbe    0x2fe
 29d:	das    
 29e:	ins    BYTE PTR es:[edi],dx
 29f:	popa   
 2a0:	outs   dx,BYTE PTR ds:[esi]
 2a1:	addr16 das 
 2a3:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2aa:	dec    ebp
 2ab:	gs je  0x316
 2ae:	outs   dx,DWORD PTR ds:[esi]
 2af:	fs push esp
 2b1:	jns    0x323
 2b3:	cmp    ecx,DWORD PTR gs:[edx+ebp*2+0x61]
 2b8:	jbe    0x31b
 2ba:	das    
 2bb:	ins    BYTE PTR es:[edi],dx
 2bc:	popa   
 2bd:	outs   dx,BYTE PTR ds:[esi]
 2be:	addr16 das 
 2c0:	push   ebx
 2c1:	je     0x335
 2c3:	imul   ebp,DWORD PTR [esi+0x67],0x6a4c5b3b
 2ca:	popa   
 2cb:	jbe    0x32e
 2cd:	das    
 2ce:	ins    BYTE PTR es:[edi],dx
 2cf:	popa   
 2d0:	outs   dx,BYTE PTR ds:[esi]
 2d1:	addr16 das 
 2d3:	dec    edi
 2d4:	bound  ebp,QWORD PTR [edx+0x65]
 2d7:	arpl   WORD PTR [ebx+edi*1+0x29],si
 2db:	dec    esp
 2dc:	push   0x61
 2de:	jbe    0x341
 2e0:	das    
 2e1:	ins    BYTE PTR es:[edi],dx
 2e2:	popa   
 2e3:	outs   dx,BYTE PTR ds:[esi]
 2e4:	addr16 das 
 2e6:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 2ed:	inc    ebx
 2ee:	popa   
 2ef:	ins    BYTE PTR es:[edi],dx
 2f0:	ins    BYTE PTR es:[edi],dx
 2f1:	push   ebx
 2f2:	imul   esi,DWORD PTR [ebp+eiz*2+0x3b],0x1390007
 2fa:	add    BYTE PTR ds:0x6176616a,ah
 300:	das    
 301:	ins    BYTE PTR es:[edi],dx
 302:	popa   
 303:	outs   dx,BYTE PTR ds:[esi]
 304:	addr16 das 
 306:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 30d:	dec    ebp
 30e:	gs je  0x379
 311:	outs   dx,DWORD PTR ds:[esi]
 312:	fs dec eax
 314:	popa   
 315:	outs   dx,BYTE PTR ds:[esi]
 316:	fs ins BYTE PTR es:[edi],dx
 318:	gs jae 0x33f
 31b:	dec    esp
 31c:	outs   dx,DWORD PTR ds:[esi]
 31d:	outs   dx,DWORD PTR ds:[esi]
 31e:	imul   esi,DWORD PTR [ebp+0x70],0x1
 322:	add    BYTE PTR [esi],bl
 324:	push   0x61
 326:	jbe    0x389
 328:	das    
 329:	ins    BYTE PTR es:[edi],dx
 32a:	popa   
 32b:	outs   dx,BYTE PTR ds:[esi]
 32c:	addr16 das 
 32e:	imul   ebp,DWORD PTR [esi+0x76],0x2f656b6f
 335:	dec    ebp
 336:	gs je  0x3a1
 339:	outs   dx,DWORD PTR ds:[esi]
 33a:	fs dec eax
 33c:	popa   
 33d:	outs   dx,BYTE PTR ds:[esi]
 33e:	fs ins BYTE PTR es:[edi],dx
 340:	gs jae 0x343
 343:	and    BYTE PTR [eax],al
 345:	add    eax,DWORD PTR [eax]
 347:	or     DWORD PTR [eax],eax
 349:	add    BYTE PTR [eax],al
 34b:	add    BYTE PTR [eax],al
 34d:	add    eax,DWORD PTR [eax]
 34f:	add    BYTE PTR [eax],al
 351:	or     al,BYTE PTR [eax]
 353:	or     eax,DWORD PTR [eax]
 355:	add    DWORD PTR [eax],eax
 357:	or     al,0x0
 359:	add    BYTE PTR [eax],al
 35b:	sbb    eax,0x1000100
 360:	add    BYTE PTR [eax],al
 362:	add    BYTE PTR ds:0x100b72a,al
 368:	mov    cl,0x0
 36a:	add    BYTE PTR [eax],al
 36c:	add    DWORD PTR [eax],eax
 36e:	or     eax,0x6000000
 373:	add    BYTE PTR [ecx],al
 375:	add    BYTE PTR [eax],al
 377:	add    BYTE PTR [eax+eax*1],al
 37a:	add    BYTE PTR [eax],al
 37c:	push   cs
 37d:	add    BYTE PTR [edi],cl
 37f:	add    BYTE PTR [ecx],al
 381:	add    BYTE PTR [eax+eax*1],cl
 384:	add    BYTE PTR [eax],al
 386:	add    DWORD PTR [eax],0x5
 389:	add    BYTE PTR [esi],al
 38b:	add    BYTE PTR [eax],al
 38d:	add    BYTE PTR [edi],bh
 38f:	sbb    eax,0x3b00a11c
 394:	sbb    al,0x1d
 396:	sbb    al,0x64
 398:	add    eax,0x536606c
 39d:	sub    edx,DWORD PTR ds:0x4152e05
 3a3:	mov    al,ds:0x5150600
 3a8:	lods   al,BYTE PTR ds:[esi]
 3a9:	sub    edx,DWORD PTR ds:0x4152e05
 3af:	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 3b0:	add    BYTE PTR [eax],dl
 3b2:	sub    ch,BYTE PTR [ebx]
 3b4:	sbb    al,0x15
 3b6:	add    eax,0x4156404
 3bb:	mov    dh,0x0
 3bd:	add    ch,BYTE PTR [edx+ebp*1+0x405152b]
 3c4:	pusha  
 3c5:	sbb    eax,0xb60415
 3ca:	add    ch,BYTE PTR [edx+eax*1+0xac]
 3d1:	add    al,BYTE PTR [eax]
 3d3:	or     eax,0x22000000
 3d8:	add    BYTE PTR [eax],cl
 3da:	add    BYTE PTR [eax],al
 3dc:	add    BYTE PTR [edi],al
 3de:	add    BYTE PTR ds:0xe000800,al
 3e4:	add    BYTE PTR [eax+eax*1],cl
 3e7:	pop    ss
 3e8:	add    BYTE PTR ds:0x11001a00,cl
 3ee:	add    BYTE PTR [ebx],ah
 3f0:	add    BYTE PTR [edx],dl
 3f2:	add    BYTE PTR [eax],dh
 3f4:	add    BYTE PTR [esi],dl
 3f6:	add    BYTE PTR ds:0x10001b00,bh
 3fc:	add    BYTE PTR [eax],al
 3fe:	add    BYTE PTR [edx],cl
 400:	add    BYTE PTR [ebx],al
 402:	cld    
 403:	add    BYTE PTR [edx],bl
 405:	add    DWORD PTR ds:0xc00fa,edx
 40b:	or     DWORD PTR [eax],eax
 40d:	adc    DWORD PTR [eax],eax
 40f:	adc    al,BYTE PTR [eax]
 411:	add    DWORD PTR [eax],eax
 413:	or     al,0x0
 415:	add    BYTE PTR [eax],al
 417:	mov    esp,0x6000500
 41c:	add    BYTE PTR [eax],al
 41e:	add    BYTE PTR [ebx+edi*4+0x0],dl
 422:	add    ebx,DWORD PTR [ecx-0x49]
 425:	add    BYTE PTR [esp+ecx*2],al
 428:	or     BYTE PTR [edx+ecx*1+0x5032c4d],bh
 42f:	dec    edi
 430:	sub    al,0x4
 432:	push   es
 433:	dec    edi
 434:	sub    al,0x5
 436:	pop    es
 437:	dec    edi
 438:	sub    al,0x6
 43a:	adc    BYTE PTR [edx],cl
 43c:	dec    edi
 43d:	sub    al,0x7
 43f:	adc    BYTE PTR [eax],ch
 441:	dec    edi
 442:	or     BYTE PTR [esi],bh
 444:	adc    BYTE PTR [edx],cl
 446:	ss add al,0x2b
 449:	sub    al,0x3
 44b:	sbb    eax,0x4156404
 450:	mov    dh,0x0
 452:	add    dh,BYTE PTR [esi]
 454:	add    eax,0xa0020515
 459:	add    BYTE PTR [esi],cl
 45b:	mov    dl,0x0
 45d:	add    eax,0xb60612
 462:	pop    es
 463:	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 464:	add    BYTE PTR [eax],dl
 466:	mov    dl,0x0
 468:	add    eax,0xba0515
 46d:	or     BYTE PTR [eax],al
 46f:	add    BYTE PTR [esi+0xb10700],dh
 475:	add    BYTE PTR [eax],al
 477:	add    al,BYTE PTR [eax]
 479:	or     eax,0x3a000000
 47e:	add    BYTE PTR [esi],cl
 480:	add    BYTE PTR [eax],al
 482:	add    BYTE PTR [ecx],ah
 484:	add    BYTE PTR [eax],cl
 486:	add    BYTE PTR [ebx],ah
 488:	add    BYTE PTR [eax+eax*1],cl
 48b:	and    al,0x0
 48d:	adc    BYTE PTR [eax],al
 48f:	and    eax,0x26001400
 494:	add    BYTE PTR [eax],bl
 496:	add    BYTE PTR [edi],ah
 498:	add    BYTE PTR ds:0x22002800,bl
 49e:	add    BYTE PTR [edx],ch
 4a0:	add    BYTE PTR [eax+eax*1],ah
 4a3:	sub    eax,DWORD PTR [eax]
 4a5:	sub    BYTE PTR [eax],al
 4a7:	sub    al,0x0
 4a9:	xor    eax,0x3b002d00
 4ae:	add    BYTE PTR [esi],ch
 4b0:	add    BYTE PTR [esi+0x0],al
 4b3:	xor    BYTE PTR [eax],al
 4b5:	push   ebx
 4b6:	add    BYTE PTR [edx],dh
 4b8:	add    BYTE PTR [eax],dl
 4ba:	add    BYTE PTR [eax],al
 4bc:	add    BYTE PTR [esi],dl
 4be:	add    BYTE PTR [edx],al
 4c0:	inc    DWORD PTR [eax]
 4c2:	inc    esi
 4c3:	add    BYTE PTR [esi],al
 4c5:	pop    es
 4c6:	add    BYTE PTR [ebx],dl
 4c8:	pop    es
 4c9:	add    BYTE PTR [ebx],al
 4cb:	pop    es
 4cc:	add    BYTE PTR [ecx+eax*1],dl
 4cf:	add    DWORD PTR [ecx],eax
 4d1:	add    BYTE PTR [eax],al
 4d3:	or     al,0x0
 4d5:	add    eax,DWORD PTR [eax]
 4d7:	adc    eax,0x2000000
 4dc:	add    BYTE PTR [esi],dl
 4de:	add    BYTE PTR ds:0xa000000,dh
 4e4:	add    BYTE PTR [ecx],al
 4e6:	add    BYTE PTR [ebx],dh
 4e8:	add    BYTE PTR [edi],dh
 4ea:	add    BYTE PTR [eax+eax*1],dh
 4ed:	sbb    DWORD PTR [eax],eax
 4ef:	pop    ds
 4f0:	add    BYTE PTR [eax],al
 4f2:	add    BYTE PTR [eax],cl
 4f4:	add    BYTE PTR [ecx],al
 4f6:	add    BYTE PTR [eax],ah
 4f8:	add    BYTE PTR [ecx],al
 4fa:	add    BYTE PTR [ecx],ah
