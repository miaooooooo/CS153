
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 1c             	sub    $0x1c,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  18:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1c:	89 3c 24             	mov    %edi,(%esp)
  1f:	e8 3c 00 00 00       	call   60 <matchhere>
  24:	85 c0                	test   %eax,%eax
  26:	75 20                	jne    48 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  28:	0f b6 03             	movzbl (%ebx),%eax
  2b:	84 c0                	test   %al,%al
  2d:	74 0f                	je     3e <matchstar+0x3e>
  2f:	0f be c0             	movsbl %al,%eax
  32:	83 c3 01             	add    $0x1,%ebx
  35:	39 f0                	cmp    %esi,%eax
  37:	74 df                	je     18 <matchstar+0x18>
  39:	83 fe 2e             	cmp    $0x2e,%esi
  3c:	74 da                	je     18 <matchstar+0x18>
  return 0;
}
  3e:	83 c4 1c             	add    $0x1c,%esp
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  41:	31 c0                	xor    %eax,%eax
  return 0;
}
  43:	5b                   	pop    %ebx
  44:	5e                   	pop    %esi
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    
  48:	83 c4 1c             	add    $0x1c,%esp

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  4b:	b8 01 00 00 00       	mov    $0x1,%eax
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
}
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5f                   	pop    %edi
  53:	5d                   	pop    %ebp
  54:	c3                   	ret    
  55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000060 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	83 ec 10             	sub    $0x10,%esp
  68:	8b 55 08             	mov    0x8(%ebp),%edx
  6b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  if(re[0] == '\0')
  6e:	0f b6 02             	movzbl (%edx),%eax
  71:	84 c0                	test   %al,%al
  73:	75 1c                	jne    91 <matchhere+0x31>
  75:	eb 51                	jmp    c8 <matchhere+0x68>
  77:	90                   	nop
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  78:	0f b6 19             	movzbl (%ecx),%ebx
  7b:	84 db                	test   %bl,%bl
  7d:	74 39                	je     b8 <matchhere+0x58>
  7f:	3c 2e                	cmp    $0x2e,%al
  81:	74 04                	je     87 <matchhere+0x27>
  83:	38 d8                	cmp    %bl,%al
  85:	75 31                	jne    b8 <matchhere+0x58>
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  87:	0f b6 02             	movzbl (%edx),%eax
  8a:	84 c0                	test   %al,%al
  8c:	74 3a                	je     c8 <matchhere+0x68>
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  8e:	83 c1 01             	add    $0x1,%ecx
// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
  91:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
  95:	8d 72 01             	lea    0x1(%edx),%esi
  98:	80 fb 2a             	cmp    $0x2a,%bl
  9b:	74 3b                	je     d8 <matchhere+0x78>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
  9d:	3c 24                	cmp    $0x24,%al
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  9f:	89 f2                	mov    %esi,%edx
  if(re[0] == '$' && re[1] == '\0')
  a1:	75 d5                	jne    78 <matchhere+0x18>
  a3:	84 db                	test   %bl,%bl
  a5:	75 d1                	jne    78 <matchhere+0x18>
    return *text == '\0';
  a7:	31 c0                	xor    %eax,%eax
  a9:	80 39 00             	cmpb   $0x0,(%ecx)
  ac:	0f 94 c0             	sete   %al
  af:	eb 09                	jmp    ba <matchhere+0x5a>
  b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  b8:	31 c0                	xor    %eax,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
  ba:	83 c4 10             	add    $0x10,%esp
  bd:	5b                   	pop    %ebx
  be:	5e                   	pop    %esi
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    
  c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  c8:	83 c4 10             	add    $0x10,%esp
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  cb:	b8 01 00 00 00       	mov    $0x1,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
  d0:	5b                   	pop    %ebx
  d1:	5e                   	pop    %esi
  d2:	5d                   	pop    %ebp
  d3:	c3                   	ret    
  d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  d8:	83 c2 02             	add    $0x2,%edx
  db:	0f be c0             	movsbl %al,%eax
  de:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  e2:	89 54 24 04          	mov    %edx,0x4(%esp)
  e6:	89 04 24             	mov    %eax,(%esp)
  e9:	e8 12 ff ff ff       	call   0 <matchstar>
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
  ee:	83 c4 10             	add    $0x10,%esp
  f1:	5b                   	pop    %ebx
  f2:	5e                   	pop    %esi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	56                   	push   %esi
 104:	53                   	push   %ebx
 105:	83 ec 10             	sub    $0x10,%esp
 108:	8b 75 08             	mov    0x8(%ebp),%esi
 10b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 10e:	80 3e 5e             	cmpb   $0x5e,(%esi)
 111:	75 08                	jne    11b <match+0x1b>
 113:	eb 2f                	jmp    144 <match+0x44>
 115:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
 118:	83 c3 01             	add    $0x1,%ebx
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
 11b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 11f:	89 34 24             	mov    %esi,(%esp)
 122:	e8 39 ff ff ff       	call   60 <matchhere>
 127:	85 c0                	test   %eax,%eax
 129:	75 0d                	jne    138 <match+0x38>
      return 1;
  }while(*text++ != '\0');
 12b:	80 3b 00             	cmpb   $0x0,(%ebx)
 12e:	75 e8                	jne    118 <match+0x18>
  return 0;
}
 130:	83 c4 10             	add    $0x10,%esp
 133:	5b                   	pop    %ebx
 134:	5e                   	pop    %esi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	90                   	nop
 138:	83 c4 10             	add    $0x10,%esp
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
 13b:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
 140:	5b                   	pop    %ebx
 141:	5e                   	pop    %esi
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 144:	83 c6 01             	add    $0x1,%esi
 147:	89 75 08             	mov    %esi,0x8(%ebp)
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	5b                   	pop    %ebx
 14e:	5e                   	pop    %esi
 14f:	5d                   	pop    %ebp

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 150:	e9 0b ff ff ff       	jmp    60 <matchhere>
 155:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	56                   	push   %esi
 165:	53                   	push   %ebx
 166:	83 ec 2c             	sub    $0x2c,%esp
 169:	8b 7d 08             	mov    0x8(%ebp),%edi
 16c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 173:	90                   	nop
 174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int n, m;
  char *p, *q;

  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 178:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 17d:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 180:	89 44 24 08          	mov    %eax,0x8(%esp)
 184:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 187:	05 a0 0a 00 00       	add    $0xaa0,%eax
 18c:	89 44 24 04          	mov    %eax,0x4(%esp)
 190:	8b 45 0c             	mov    0xc(%ebp),%eax
 193:	89 04 24             	mov    %eax,(%esp)
 196:	e8 05 04 00 00       	call   5a0 <read>
 19b:	85 c0                	test   %eax,%eax
 19d:	0f 8e b9 00 00 00    	jle    25c <grep+0xfc>
    m += n;
 1a3:	01 45 e4             	add    %eax,-0x1c(%ebp)
    buf[m] = '\0';
 1a6:	be a0 0a 00 00       	mov    $0xaa0,%esi
 1ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 1ae:	c6 80 a0 0a 00 00 00 	movb   $0x0,0xaa0(%eax)
 1b5:	8d 76 00             	lea    0x0(%esi),%esi
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 1b8:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 1bf:	00 
 1c0:	89 34 24             	mov    %esi,(%esp)
 1c3:	e8 58 02 00 00       	call   420 <strchr>
 1c8:	85 c0                	test   %eax,%eax
 1ca:	89 c3                	mov    %eax,%ebx
 1cc:	74 42                	je     210 <grep+0xb0>
      *q = 0;
 1ce:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 1d1:	89 74 24 04          	mov    %esi,0x4(%esp)
 1d5:	89 3c 24             	mov    %edi,(%esp)
 1d8:	e8 23 ff ff ff       	call   100 <match>
 1dd:	85 c0                	test   %eax,%eax
 1df:	75 07                	jne    1e8 <grep+0x88>
 1e1:	83 c3 01             	add    $0x1,%ebx
        *q = '\n';
        write(1, p, q+1 - p);
 1e4:	89 de                	mov    %ebx,%esi
 1e6:	eb d0                	jmp    1b8 <grep+0x58>
    buf[m] = '\0';
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      *q = 0;
      if(match(pattern, p)){
        *q = '\n';
 1e8:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 1eb:	83 c3 01             	add    $0x1,%ebx
 1ee:	89 d8                	mov    %ebx,%eax
 1f0:	29 f0                	sub    %esi,%eax
 1f2:	89 74 24 04          	mov    %esi,0x4(%esp)
 1f6:	89 de                	mov    %ebx,%esi
 1f8:	89 44 24 08          	mov    %eax,0x8(%esp)
 1fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 203:	e8 a0 03 00 00       	call   5a8 <write>
 208:	eb ae                	jmp    1b8 <grep+0x58>
 20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      }
      p = q+1;
    }
    if(p == buf)
 210:	81 fe a0 0a 00 00    	cmp    $0xaa0,%esi
 216:	74 38                	je     250 <grep+0xf0>
      m = 0;
    if(m > 0){
 218:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 21b:	85 c0                	test   %eax,%eax
 21d:	0f 8e 55 ff ff ff    	jle    178 <grep+0x18>
      m -= p - buf;
 223:	81 45 e4 a0 0a 00 00 	addl   $0xaa0,-0x1c(%ebp)
 22a:	29 75 e4             	sub    %esi,-0x1c(%ebp)
      memmove(buf, p, m);
 22d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 230:	89 74 24 04          	mov    %esi,0x4(%esp)
 234:	c7 04 24 a0 0a 00 00 	movl   $0xaa0,(%esp)
 23b:	89 44 24 08          	mov    %eax,0x8(%esp)
 23f:	e8 5c 02 00 00       	call   4a0 <memmove>
 244:	e9 2f ff ff ff       	jmp    178 <grep+0x18>
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 250:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 257:	e9 1c ff ff ff       	jmp    178 <grep+0x18>
    }
  }
}
 25c:	83 c4 2c             	add    $0x2c,%esp
 25f:	5b                   	pop    %ebx
 260:	5e                   	pop    %esi
 261:	5f                   	pop    %edi
 262:	5d                   	pop    %ebp
 263:	c3                   	ret    
 264:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 26a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000270 <main>:

int
main(int argc, char *argv[])
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	83 e4 f0             	and    $0xfffffff0,%esp
 276:	57                   	push   %edi
 277:	56                   	push   %esi
 278:	53                   	push   %ebx
 279:	83 ec 24             	sub    $0x24,%esp
 27c:	8b 7d 08             	mov    0x8(%ebp),%edi
 27f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
 282:	83 ff 01             	cmp    $0x1,%edi
 285:	0f 8e b5 00 00 00    	jle    340 <main+0xd0>
    printf(2, "usage: grep pattern [file ...]\n");
    exit(0);
  }
  pattern = argv[1];
 28b:	8b 43 04             	mov    0x4(%ebx),%eax

  if(argc <= 2){
 28e:	83 ff 02             	cmp    $0x2,%edi

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
    exit(0);
  }
  pattern = argv[1];
 291:	89 44 24 1c          	mov    %eax,0x1c(%esp)

  if(argc <= 2){
 295:	0f 84 85 00 00 00    	je     320 <main+0xb0>
    grep(pattern, 0);
    exit(0);
 29b:	83 c3 08             	add    $0x8,%ebx
 29e:	be 02 00 00 00       	mov    $0x2,%esi
 2a3:	90                   	nop
 2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
 2a8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2af:	00 
 2b0:	8b 03                	mov    (%ebx),%eax
 2b2:	89 04 24             	mov    %eax,(%esp)
 2b5:	e8 0e 03 00 00       	call   5c8 <open>
 2ba:	85 c0                	test   %eax,%eax
 2bc:	78 3a                	js     2f8 <main+0x88>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit(0);
    }
    grep(pattern, fd);
 2be:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  if(argc <= 2){
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
 2c2:	83 c6 01             	add    $0x1,%esi
 2c5:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit(0);
    }
    grep(pattern, fd);
 2c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cc:	89 44 24 18          	mov    %eax,0x18(%esp)
 2d0:	89 14 24             	mov    %edx,(%esp)
 2d3:	e8 88 fe ff ff       	call   160 <grep>
    close(fd);
 2d8:	8b 44 24 18          	mov    0x18(%esp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 cc 02 00 00       	call   5b0 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
 2e4:	39 f7                	cmp    %esi,%edi
 2e6:	7f c0                	jg     2a8 <main+0x38>
      exit(0);
    }
    grep(pattern, fd);
    close(fd);
  }
  exit(0);
 2e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ef:	e8 94 02 00 00       	call   588 <exit>
 2f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit(0);
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
 2f8:	8b 03                	mov    (%ebx),%eax
 2fa:	c7 44 24 04 48 0a 00 	movl   $0xa48,0x4(%esp)
 301:	00 
 302:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 309:	89 44 24 08          	mov    %eax,0x8(%esp)
 30d:	e8 ae 03 00 00       	call   6c0 <printf>
      exit(0);
 312:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 319:	e8 6a 02 00 00       	call   588 <exit>
 31e:	66 90                	xchg   %ax,%ax
    exit(0);
  }
  pattern = argv[1];

  if(argc <= 2){
    grep(pattern, 0);
 320:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 327:	00 
 328:	89 04 24             	mov    %eax,(%esp)
 32b:	e8 30 fe ff ff       	call   160 <grep>
    exit(0);
 330:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 337:	e8 4c 02 00 00       	call   588 <exit>
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd, i;
  char *pattern;

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
 340:	c7 44 24 04 28 0a 00 	movl   $0xa28,0x4(%esp)
 347:	00 
 348:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 34f:	e8 6c 03 00 00       	call   6c0 <printf>
    exit(0);
 354:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 35b:	e8 28 02 00 00       	call   588 <exit>

00000360 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 360:	55                   	push   %ebp
 361:	31 d2                	xor    %edx,%edx
 363:	89 e5                	mov    %esp,%ebp
 365:	8b 45 08             	mov    0x8(%ebp),%eax
 368:	53                   	push   %ebx
 369:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 370:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 374:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 377:	83 c2 01             	add    $0x1,%edx
 37a:	84 c9                	test   %cl,%cl
 37c:	75 f2                	jne    370 <strcpy+0x10>
    ;
  return os;
}
 37e:	5b                   	pop    %ebx
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    
 381:	eb 0d                	jmp    390 <strcmp>
 383:	90                   	nop
 384:	90                   	nop
 385:	90                   	nop
 386:	90                   	nop
 387:	90                   	nop
 388:	90                   	nop
 389:	90                   	nop
 38a:	90                   	nop
 38b:	90                   	nop
 38c:	90                   	nop
 38d:	90                   	nop
 38e:	90                   	nop
 38f:	90                   	nop

00000390 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 4d 08             	mov    0x8(%ebp),%ecx
 396:	53                   	push   %ebx
 397:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 39a:	0f b6 01             	movzbl (%ecx),%eax
 39d:	84 c0                	test   %al,%al
 39f:	75 14                	jne    3b5 <strcmp+0x25>
 3a1:	eb 25                	jmp    3c8 <strcmp+0x38>
 3a3:	90                   	nop
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 3a8:	83 c1 01             	add    $0x1,%ecx
 3ab:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3ae:	0f b6 01             	movzbl (%ecx),%eax
 3b1:	84 c0                	test   %al,%al
 3b3:	74 13                	je     3c8 <strcmp+0x38>
 3b5:	0f b6 1a             	movzbl (%edx),%ebx
 3b8:	38 d8                	cmp    %bl,%al
 3ba:	74 ec                	je     3a8 <strcmp+0x18>
 3bc:	0f b6 db             	movzbl %bl,%ebx
 3bf:	0f b6 c0             	movzbl %al,%eax
 3c2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 3c4:	5b                   	pop    %ebx
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
 3c7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3c8:	0f b6 1a             	movzbl (%edx),%ebx
 3cb:	31 c0                	xor    %eax,%eax
 3cd:	0f b6 db             	movzbl %bl,%ebx
 3d0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 3d2:	5b                   	pop    %ebx
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret    
 3d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003e0 <strlen>:

uint
strlen(char *s)
{
 3e0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 3e1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 3e3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 3e5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 3e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3ea:	80 39 00             	cmpb   $0x0,(%ecx)
 3ed:	74 0c                	je     3fb <strlen+0x1b>
 3ef:	90                   	nop
 3f0:	83 c2 01             	add    $0x1,%edx
 3f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3f7:	89 d0                	mov    %edx,%eax
 3f9:	75 f5                	jne    3f0 <strlen+0x10>
    ;
  return n;
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
 3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 55 08             	mov    0x8(%ebp),%edx
 406:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 407:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	89 d7                	mov    %edx,%edi
 40f:	fc                   	cld    
 410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 412:	89 d0                	mov    %edx,%eax
 414:	5f                   	pop    %edi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 42a:	0f b6 10             	movzbl (%eax),%edx
 42d:	84 d2                	test   %dl,%dl
 42f:	75 11                	jne    442 <strchr+0x22>
 431:	eb 15                	jmp    448 <strchr+0x28>
 433:	90                   	nop
 434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 438:	83 c0 01             	add    $0x1,%eax
 43b:	0f b6 10             	movzbl (%eax),%edx
 43e:	84 d2                	test   %dl,%dl
 440:	74 06                	je     448 <strchr+0x28>
    if(*s == c)
 442:	38 ca                	cmp    %cl,%dl
 444:	75 f2                	jne    438 <strchr+0x18>
      return (char*)s;
  return 0;
}
 446:	5d                   	pop    %ebp
 447:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 448:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
 44a:	5d                   	pop    %ebp
 44b:	90                   	nop
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 450:	c3                   	ret    
 451:	eb 0d                	jmp    460 <atoi>
 453:	90                   	nop
 454:	90                   	nop
 455:	90                   	nop
 456:	90                   	nop
 457:	90                   	nop
 458:	90                   	nop
 459:	90                   	nop
 45a:	90                   	nop
 45b:	90                   	nop
 45c:	90                   	nop
 45d:	90                   	nop
 45e:	90                   	nop
 45f:	90                   	nop

00000460 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 460:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 461:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 463:	89 e5                	mov    %esp,%ebp
 465:	8b 4d 08             	mov    0x8(%ebp),%ecx
 468:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 469:	0f b6 11             	movzbl (%ecx),%edx
 46c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 46f:	80 fb 09             	cmp    $0x9,%bl
 472:	77 1c                	ja     490 <atoi+0x30>
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 478:	0f be d2             	movsbl %dl,%edx
 47b:	83 c1 01             	add    $0x1,%ecx
 47e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 481:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 485:	0f b6 11             	movzbl (%ecx),%edx
 488:	8d 5a d0             	lea    -0x30(%edx),%ebx
 48b:	80 fb 09             	cmp    $0x9,%bl
 48e:	76 e8                	jbe    478 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 490:	5b                   	pop    %ebx
 491:	5d                   	pop    %ebp
 492:	c3                   	ret    
 493:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	56                   	push   %esi
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	53                   	push   %ebx
 4a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4ae:	85 db                	test   %ebx,%ebx
 4b0:	7e 14                	jle    4c6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 4b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 4bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 4bf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4c2:	39 da                	cmp    %ebx,%edx
 4c4:	75 f2                	jne    4b8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 4c6:	5b                   	pop    %ebx
 4c7:	5e                   	pop    %esi
 4c8:	5d                   	pop    %ebp
 4c9:	c3                   	ret    
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004d0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 4d9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 4dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 4df:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4eb:	00 
 4ec:	89 04 24             	mov    %eax,(%esp)
 4ef:	e8 d4 00 00 00       	call   5c8 <open>
  if(fd < 0)
 4f4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 4f8:	78 19                	js     513 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 4fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fd:	89 1c 24             	mov    %ebx,(%esp)
 500:	89 44 24 04          	mov    %eax,0x4(%esp)
 504:	e8 d7 00 00 00       	call   5e0 <fstat>
  close(fd);
 509:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 50c:	89 c6                	mov    %eax,%esi
  close(fd);
 50e:	e8 9d 00 00 00       	call   5b0 <close>
  return r;
}
 513:	89 f0                	mov    %esi,%eax
 515:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 518:	8b 75 fc             	mov    -0x4(%ebp),%esi
 51b:	89 ec                	mov    %ebp,%esp
 51d:	5d                   	pop    %ebp
 51e:	c3                   	ret    
 51f:	90                   	nop

00000520 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	31 f6                	xor    %esi,%esi
 527:	53                   	push   %ebx
 528:	83 ec 2c             	sub    $0x2c,%esp
 52b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 52e:	eb 06                	jmp    536 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 530:	3c 0a                	cmp    $0xa,%al
 532:	74 39                	je     56d <gets+0x4d>
 534:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 536:	8d 5e 01             	lea    0x1(%esi),%ebx
 539:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 53c:	7d 31                	jge    56f <gets+0x4f>
    cc = read(0, &c, 1);
 53e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 541:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 548:	00 
 549:	89 44 24 04          	mov    %eax,0x4(%esp)
 54d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 554:	e8 47 00 00 00       	call   5a0 <read>
    if(cc < 1)
 559:	85 c0                	test   %eax,%eax
 55b:	7e 12                	jle    56f <gets+0x4f>
      break;
    buf[i++] = c;
 55d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 561:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 565:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 569:	3c 0d                	cmp    $0xd,%al
 56b:	75 c3                	jne    530 <gets+0x10>
 56d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 56f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 573:	89 f8                	mov    %edi,%eax
 575:	83 c4 2c             	add    $0x2c,%esp
 578:	5b                   	pop    %ebx
 579:	5e                   	pop    %esi
 57a:	5f                   	pop    %edi
 57b:	5d                   	pop    %ebp
 57c:	c3                   	ret    
 57d:	90                   	nop
 57e:	90                   	nop
 57f:	90                   	nop

00000580 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 580:	b8 01 00 00 00       	mov    $0x1,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <exit>:
SYSCALL(exit)
 588:	b8 02 00 00 00       	mov    $0x2,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <wait>:
SYSCALL(wait)
 590:	b8 03 00 00 00       	mov    $0x3,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <pipe>:
SYSCALL(pipe)
 598:	b8 04 00 00 00       	mov    $0x4,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <read>:
SYSCALL(read)
 5a0:	b8 05 00 00 00       	mov    $0x5,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <write>:
SYSCALL(write)
 5a8:	b8 10 00 00 00       	mov    $0x10,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <close>:
SYSCALL(close)
 5b0:	b8 15 00 00 00       	mov    $0x15,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <kill>:
SYSCALL(kill)
 5b8:	b8 06 00 00 00       	mov    $0x6,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <exec>:
SYSCALL(exec)
 5c0:	b8 07 00 00 00       	mov    $0x7,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <open>:
SYSCALL(open)
 5c8:	b8 0f 00 00 00       	mov    $0xf,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <mknod>:
SYSCALL(mknod)
 5d0:	b8 11 00 00 00       	mov    $0x11,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <unlink>:
SYSCALL(unlink)
 5d8:	b8 12 00 00 00       	mov    $0x12,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <fstat>:
SYSCALL(fstat)
 5e0:	b8 08 00 00 00       	mov    $0x8,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <link>:
SYSCALL(link)
 5e8:	b8 13 00 00 00       	mov    $0x13,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <mkdir>:
SYSCALL(mkdir)
 5f0:	b8 14 00 00 00       	mov    $0x14,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <chdir>:
SYSCALL(chdir)
 5f8:	b8 09 00 00 00       	mov    $0x9,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <dup>:
SYSCALL(dup)
 600:	b8 0a 00 00 00       	mov    $0xa,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <getpid>:
SYSCALL(getpid)
 608:	b8 0b 00 00 00       	mov    $0xb,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <sbrk>:
SYSCALL(sbrk)
 610:	b8 0c 00 00 00       	mov    $0xc,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <sleep>:
SYSCALL(sleep)
 618:	b8 0d 00 00 00       	mov    $0xd,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <uptime>:
SYSCALL(uptime)
 620:	b8 0e 00 00 00       	mov    $0xe,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <test>:
SYSCALL(test)
 628:	b8 16 00 00 00       	mov    $0x16,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	89 cf                	mov    %ecx,%edi
 636:	56                   	push   %esi
 637:	89 c6                	mov    %eax,%esi
 639:	53                   	push   %ebx
 63a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 63d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 640:	85 c9                	test   %ecx,%ecx
 642:	74 04                	je     648 <printint+0x18>
 644:	85 d2                	test   %edx,%edx
 646:	78 68                	js     6b0 <printint+0x80>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 648:	89 d0                	mov    %edx,%eax
 64a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 651:	31 c9                	xor    %ecx,%ecx
 653:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 656:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 658:	31 d2                	xor    %edx,%edx
 65a:	f7 f7                	div    %edi
 65c:	0f b6 92 65 0a 00 00 	movzbl 0xa65(%edx),%edx
 663:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 666:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 669:	85 c0                	test   %eax,%eax
 66b:	75 eb                	jne    658 <printint+0x28>
  if(neg)
 66d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 670:	85 c0                	test   %eax,%eax
 672:	74 08                	je     67c <printint+0x4c>
    buf[i++] = '-';
 674:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 679:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 67c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 67f:	90                   	nop
 680:	0f b6 04 3b          	movzbl (%ebx,%edi,1),%eax
 684:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 687:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 68e:	00 
 68f:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 692:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 695:	8d 45 e7             	lea    -0x19(%ebp),%eax
 698:	89 44 24 04          	mov    %eax,0x4(%esp)
 69c:	e8 07 ff ff ff       	call   5a8 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6a1:	83 ff ff             	cmp    $0xffffffff,%edi
 6a4:	75 da                	jne    680 <printint+0x50>
    putc(fd, buf[i]);
}
 6a6:	83 c4 4c             	add    $0x4c,%esp
 6a9:	5b                   	pop    %ebx
 6aa:	5e                   	pop    %esi
 6ab:	5f                   	pop    %edi
 6ac:	5d                   	pop    %ebp
 6ad:	c3                   	ret    
 6ae:	66 90                	xchg   %ax,%ax
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6b0:	89 d0                	mov    %edx,%eax
 6b2:	f7 d8                	neg    %eax
 6b4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 6bb:	eb 94                	jmp    651 <printint+0x21>
 6bd:	8d 76 00             	lea    0x0(%esi),%esi

000006c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 6cc:	0f b6 10             	movzbl (%eax),%edx
 6cf:	84 d2                	test   %dl,%dl
 6d1:	0f 84 c1 00 00 00    	je     798 <printf+0xd8>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6d7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 6da:	31 ff                	xor    %edi,%edi
 6dc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 6df:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6e1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 6e4:	eb 1e                	jmp    704 <printf+0x44>
 6e6:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6e8:	83 fa 25             	cmp    $0x25,%edx
 6eb:	0f 85 af 00 00 00    	jne    7a0 <printf+0xe0>
 6f1:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f5:	83 c3 01             	add    $0x1,%ebx
 6f8:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 6fc:	84 d2                	test   %dl,%dl
 6fe:	0f 84 94 00 00 00    	je     798 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 704:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 706:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 709:	74 dd                	je     6e8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 70b:	83 ff 25             	cmp    $0x25,%edi
 70e:	75 e5                	jne    6f5 <printf+0x35>
      if(c == 'd'){
 710:	83 fa 64             	cmp    $0x64,%edx
 713:	0f 84 3f 01 00 00    	je     858 <printf+0x198>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 719:	83 fa 70             	cmp    $0x70,%edx
 71c:	0f 84 a6 00 00 00    	je     7c8 <printf+0x108>
 722:	83 fa 78             	cmp    $0x78,%edx
 725:	0f 84 9d 00 00 00    	je     7c8 <printf+0x108>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 72b:	83 fa 73             	cmp    $0x73,%edx
 72e:	66 90                	xchg   %ax,%ax
 730:	0f 84 ba 00 00 00    	je     7f0 <printf+0x130>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 736:	83 fa 63             	cmp    $0x63,%edx
 739:	0f 84 41 01 00 00    	je     880 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 73f:	83 fa 25             	cmp    $0x25,%edx
 742:	0f 84 00 01 00 00    	je     848 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 748:	8b 4d 08             	mov    0x8(%ebp),%ecx
 74b:	89 55 cc             	mov    %edx,-0x34(%ebp)
 74e:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 752:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 759:	00 
 75a:	89 74 24 04          	mov    %esi,0x4(%esp)
 75e:	89 0c 24             	mov    %ecx,(%esp)
 761:	e8 42 fe ff ff       	call   5a8 <write>
 766:	8b 55 cc             	mov    -0x34(%ebp),%edx
 769:	88 55 e7             	mov    %dl,-0x19(%ebp)
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 76f:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 772:	31 ff                	xor    %edi,%edi
 774:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 77b:	00 
 77c:	89 74 24 04          	mov    %esi,0x4(%esp)
 780:	89 04 24             	mov    %eax,(%esp)
 783:	e8 20 fe ff ff       	call   5a8 <write>
 788:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 78b:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 78f:	84 d2                	test   %dl,%dl
 791:	0f 85 6d ff ff ff    	jne    704 <printf+0x44>
 797:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 798:	83 c4 3c             	add    $0x3c,%esp
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 7a3:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7a6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7ad:	00 
 7ae:	89 74 24 04          	mov    %esi,0x4(%esp)
 7b2:	89 04 24             	mov    %eax,(%esp)
 7b5:	e8 ee fd ff ff       	call   5a8 <write>
 7ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 7bd:	e9 33 ff ff ff       	jmp    6f5 <printf+0x35>
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 7c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 7cb:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 7d0:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 7d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 7d9:	8b 10                	mov    (%eax),%edx
 7db:	8b 45 08             	mov    0x8(%ebp),%eax
 7de:	e8 4d fe ff ff       	call   630 <printint>
 7e3:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 7e6:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 7ea:	e9 06 ff ff ff       	jmp    6f5 <printf+0x35>
 7ef:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 7f0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
        if(s == 0)
 7f3:	b9 5e 0a 00 00       	mov    $0xa5e,%ecx
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 7f8:	8b 3a                	mov    (%edx),%edi
        ap++;
 7fa:	83 c2 04             	add    $0x4,%edx
 7fd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 800:	85 ff                	test   %edi,%edi
 802:	0f 44 f9             	cmove  %ecx,%edi
          s = "(null)";
        while(*s != 0){
 805:	0f b6 17             	movzbl (%edi),%edx
 808:	84 d2                	test   %dl,%dl
 80a:	74 33                	je     83f <printf+0x17f>
 80c:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 80f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          putc(fd, *s);
          s++;
 818:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 81b:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 81e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 825:	00 
 826:	89 74 24 04          	mov    %esi,0x4(%esp)
 82a:	89 1c 24             	mov    %ebx,(%esp)
 82d:	e8 76 fd ff ff       	call   5a8 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 832:	0f b6 17             	movzbl (%edi),%edx
 835:	84 d2                	test   %dl,%dl
 837:	75 df                	jne    818 <printf+0x158>
 839:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 83c:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 83f:	31 ff                	xor    %edi,%edi
 841:	e9 af fe ff ff       	jmp    6f5 <printf+0x35>
 846:	66 90                	xchg   %ax,%ax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 848:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 84c:	e9 1b ff ff ff       	jmp    76c <printf+0xac>
 851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 858:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 85b:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 860:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 863:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 86a:	8b 10                	mov    (%eax),%edx
 86c:	8b 45 08             	mov    0x8(%ebp),%eax
 86f:	e8 bc fd ff ff       	call   630 <printint>
 874:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 877:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 87b:	e9 75 fe ff ff       	jmp    6f5 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 880:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        putc(fd, *ap);
        ap++;
 883:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 885:	8b 4d 08             	mov    0x8(%ebp),%ecx
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 888:	8b 02                	mov    (%edx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 88a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 891:	00 
 892:	89 74 24 04          	mov    %esi,0x4(%esp)
 896:	89 0c 24             	mov    %ecx,(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 899:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 89c:	e8 07 fd ff ff       	call   5a8 <write>
 8a1:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 8a4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 8a8:	e9 48 fe ff ff       	jmp    6f5 <printf+0x35>
 8ad:	90                   	nop
 8ae:	90                   	nop
 8af:	90                   	nop

000008b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b1:	a1 88 0a 00 00       	mov    0xa88,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	57                   	push   %edi
 8b9:	56                   	push   %esi
 8ba:	53                   	push   %ebx
 8bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c1:	39 c8                	cmp    %ecx,%eax
 8c3:	73 1d                	jae    8e2 <free+0x32>
 8c5:	8d 76 00             	lea    0x0(%esi),%esi
 8c8:	8b 10                	mov    (%eax),%edx
 8ca:	39 d1                	cmp    %edx,%ecx
 8cc:	72 1a                	jb     8e8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ce:	39 d0                	cmp    %edx,%eax
 8d0:	72 08                	jb     8da <free+0x2a>
 8d2:	39 c8                	cmp    %ecx,%eax
 8d4:	72 12                	jb     8e8 <free+0x38>
 8d6:	39 d1                	cmp    %edx,%ecx
 8d8:	72 0e                	jb     8e8 <free+0x38>
 8da:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8dc:	39 c8                	cmp    %ecx,%eax
 8de:	66 90                	xchg   %ax,%ax
 8e0:	72 e6                	jb     8c8 <free+0x18>
 8e2:	8b 10                	mov    (%eax),%edx
 8e4:	eb e8                	jmp    8ce <free+0x1e>
 8e6:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 8e8:	8b 71 04             	mov    0x4(%ecx),%esi
 8eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ee:	39 d7                	cmp    %edx,%edi
 8f0:	74 19                	je     90b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8f2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8f5:	8b 50 04             	mov    0x4(%eax),%edx
 8f8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8fb:	39 ce                	cmp    %ecx,%esi
 8fd:	74 23                	je     922 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8ff:	89 08                	mov    %ecx,(%eax)
  freep = p;
 901:	a3 88 0a 00 00       	mov    %eax,0xa88
}
 906:	5b                   	pop    %ebx
 907:	5e                   	pop    %esi
 908:	5f                   	pop    %edi
 909:	5d                   	pop    %ebp
 90a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 90b:	03 72 04             	add    0x4(%edx),%esi
 90e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 911:	8b 10                	mov    (%eax),%edx
 913:	8b 12                	mov    (%edx),%edx
 915:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 918:	8b 50 04             	mov    0x4(%eax),%edx
 91b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 91e:	39 ce                	cmp    %ecx,%esi
 920:	75 dd                	jne    8ff <free+0x4f>
    p->s.size += bp->s.size;
 922:	03 51 04             	add    0x4(%ecx),%edx
 925:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 928:	8b 53 f8             	mov    -0x8(%ebx),%edx
 92b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 92d:	a3 88 0a 00 00       	mov    %eax,0xa88
}
 932:	5b                   	pop    %ebx
 933:	5e                   	pop    %esi
 934:	5f                   	pop    %edi
 935:	5d                   	pop    %ebp
 936:	c3                   	ret    
 937:	89 f6                	mov    %esi,%esi
 939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000940 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
 943:	57                   	push   %edi
 944:	56                   	push   %esi
 945:	53                   	push   %ebx
 946:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 949:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 94c:	8b 0d 88 0a 00 00    	mov    0xa88,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 952:	83 c3 07             	add    $0x7,%ebx
 955:	c1 eb 03             	shr    $0x3,%ebx
 958:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 95b:	85 c9                	test   %ecx,%ecx
 95d:	0f 84 9b 00 00 00    	je     9fe <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 963:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 965:	8b 50 04             	mov    0x4(%eax),%edx
 968:	39 d3                	cmp    %edx,%ebx
 96a:	76 27                	jbe    993 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 96c:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 973:	be 00 80 00 00       	mov    $0x8000,%esi
 978:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 97b:	90                   	nop
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 980:	3b 05 88 0a 00 00    	cmp    0xa88,%eax
 986:	74 30                	je     9b8 <malloc+0x78>
 988:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98a:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 98c:	8b 50 04             	mov    0x4(%eax),%edx
 98f:	39 d3                	cmp    %edx,%ebx
 991:	77 ed                	ja     980 <malloc+0x40>
      if(p->s.size == nunits)
 993:	39 d3                	cmp    %edx,%ebx
 995:	74 61                	je     9f8 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 997:	29 da                	sub    %ebx,%edx
 999:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 99c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 99f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9a2:	89 0d 88 0a 00 00    	mov    %ecx,0xa88
      return (void*)(p + 1);
 9a8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9ab:	83 c4 2c             	add    $0x2c,%esp
 9ae:	5b                   	pop    %ebx
 9af:	5e                   	pop    %esi
 9b0:	5f                   	pop    %edi
 9b1:	5d                   	pop    %ebp
 9b2:	c3                   	ret    
 9b3:	90                   	nop
 9b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 9b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9bb:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 9c1:	bf 00 10 00 00       	mov    $0x1000,%edi
 9c6:	0f 43 fb             	cmovae %ebx,%edi
 9c9:	0f 42 c6             	cmovb  %esi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 9cc:	89 04 24             	mov    %eax,(%esp)
 9cf:	e8 3c fc ff ff       	call   610 <sbrk>
  if(p == (char*)-1)
 9d4:	83 f8 ff             	cmp    $0xffffffff,%eax
 9d7:	74 18                	je     9f1 <malloc+0xb1>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9d9:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 9dc:	83 c0 08             	add    $0x8,%eax
 9df:	89 04 24             	mov    %eax,(%esp)
 9e2:	e8 c9 fe ff ff       	call   8b0 <free>
  return freep;
 9e7:	8b 0d 88 0a 00 00    	mov    0xa88,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 9ed:	85 c9                	test   %ecx,%ecx
 9ef:	75 99                	jne    98a <malloc+0x4a>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9f1:	31 c0                	xor    %eax,%eax
 9f3:	eb b6                	jmp    9ab <malloc+0x6b>
 9f5:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 9f8:	8b 10                	mov    (%eax),%edx
 9fa:	89 11                	mov    %edx,(%ecx)
 9fc:	eb a4                	jmp    9a2 <malloc+0x62>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 9fe:	c7 05 88 0a 00 00 80 	movl   $0xa80,0xa88
 a05:	0a 00 00 
    base.s.size = 0;
 a08:	b9 80 0a 00 00       	mov    $0xa80,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 a0d:	c7 05 80 0a 00 00 80 	movl   $0xa80,0xa80
 a14:	0a 00 00 
    base.s.size = 0;
 a17:	c7 05 84 0a 00 00 00 	movl   $0x0,0xa84
 a1e:	00 00 00 
 a21:	e9 3d ff ff ff       	jmp    963 <malloc+0x23>
