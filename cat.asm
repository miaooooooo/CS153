
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 ec 10             	sub    $0x10,%esp
   8:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   b:	eb 1f                	jmp    2c <cat+0x2c>
   d:	8d 76 00             	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  10:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  14:	c7 44 24 04 a0 08 00 	movl   $0x8a0,0x4(%esp)
  1b:	00 
  1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  23:	e8 70 03 00 00       	call   398 <write>
  28:	39 c3                	cmp    %eax,%ebx
  2a:	75 28                	jne    54 <cat+0x54>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  2c:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  33:	00 
  34:	c7 44 24 04 a0 08 00 	movl   $0x8a0,0x4(%esp)
  3b:	00 
  3c:	89 34 24             	mov    %esi,(%esp)
  3f:	e8 4c 03 00 00       	call   390 <read>
  44:	83 f8 00             	cmp    $0x0,%eax
  47:	89 c3                	mov    %eax,%ebx
  49:	7f c5                	jg     10 <cat+0x10>
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit(0);
    }
  }
  if(n < 0){
  4b:	75 27                	jne    74 <cat+0x74>
    printf(1, "cat: read error\n");
    exit(0);
  }
}
  4d:	83 c4 10             	add    $0x10,%esp
  50:	5b                   	pop    %ebx
  51:	5e                   	pop    %esi
  52:	5d                   	pop    %ebp
  53:	c3                   	ret    
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
  54:	c7 44 24 04 16 08 00 	movl   $0x816,0x4(%esp)
  5b:	00 
  5c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  63:	e8 48 04 00 00       	call   4b0 <printf>
      exit(0);
  68:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  6f:	e8 04 03 00 00       	call   378 <exit>
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
  74:	c7 44 24 04 28 08 00 	movl   $0x828,0x4(%esp)
  7b:	00 
  7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  83:	e8 28 04 00 00       	call   4b0 <printf>
    exit(0);
  88:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8f:	e8 e4 02 00 00       	call   378 <exit>
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <main>:
  }
}

int
main(int argc, char *argv[])
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	83 e4 f0             	and    $0xfffffff0,%esp
  a6:	57                   	push   %edi
  a7:	56                   	push   %esi
  a8:	53                   	push   %ebx
  a9:	83 ec 24             	sub    $0x24,%esp
  ac:	8b 7d 08             	mov    0x8(%ebp),%edi
  int fd, i;

  if(argc <= 1){
  af:	83 ff 01             	cmp    $0x1,%edi
  b2:	7e 7c                	jle    130 <main+0x90>
    cat(0);
    exit(0);
  b4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  b7:	be 01 00 00 00       	mov    $0x1,%esi
  bc:	83 c3 04             	add    $0x4,%ebx
  bf:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  c0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c7:	00 
  c8:	8b 03                	mov    (%ebx),%eax
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 e6 02 00 00       	call   3b8 <open>
  d2:	85 c0                	test   %eax,%eax
  d4:	78 32                	js     108 <main+0x68>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit(0);
    }
    cat(fd);
  d6:	89 04 24             	mov    %eax,(%esp)
  if(argc <= 1){
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
  d9:	83 c6 01             	add    $0x1,%esi
  dc:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit(0);
    }
    cat(fd);
  df:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  e3:	e8 18 ff ff ff       	call   0 <cat>
    close(fd);
  e8:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  ec:	89 04 24             	mov    %eax,(%esp)
  ef:	e8 ac 02 00 00       	call   3a0 <close>
  if(argc <= 1){
    cat(0);
    exit(0);
  }

  for(i = 1; i < argc; i++){
  f4:	39 f7                	cmp    %esi,%edi
  f6:	7f c8                	jg     c0 <main+0x20>
      exit(0);
    }
    cat(fd);
    close(fd);
  }
  exit(0);
  f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  ff:	e8 74 02 00 00       	call   378 <exit>
 104:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
 108:	8b 03                	mov    (%ebx),%eax
 10a:	c7 44 24 04 39 08 00 	movl   $0x839,0x4(%esp)
 111:	00 
 112:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 119:	89 44 24 08          	mov    %eax,0x8(%esp)
 11d:	e8 8e 03 00 00       	call   4b0 <printf>
      exit(0);
 122:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 129:	e8 4a 02 00 00       	call   378 <exit>
 12e:	66 90                	xchg   %ax,%ax
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
 130:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 137:	e8 c4 fe ff ff       	call   0 <cat>
    exit(0);
 13c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 143:	e8 30 02 00 00       	call   378 <exit>
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 150:	55                   	push   %ebp
 151:	31 d2                	xor    %edx,%edx
 153:	89 e5                	mov    %esp,%ebp
 155:	8b 45 08             	mov    0x8(%ebp),%eax
 158:	53                   	push   %ebx
 159:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 160:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 164:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 167:	83 c2 01             	add    $0x1,%edx
 16a:	84 c9                	test   %cl,%cl
 16c:	75 f2                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 16e:	5b                   	pop    %ebx
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	eb 0d                	jmp    180 <strcmp>
 173:	90                   	nop
 174:	90                   	nop
 175:	90                   	nop
 176:	90                   	nop
 177:	90                   	nop
 178:	90                   	nop
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop
 17c:	90                   	nop
 17d:	90                   	nop
 17e:	90                   	nop
 17f:	90                   	nop

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
 186:	53                   	push   %ebx
 187:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 18a:	0f b6 01             	movzbl (%ecx),%eax
 18d:	84 c0                	test   %al,%al
 18f:	75 14                	jne    1a5 <strcmp+0x25>
 191:	eb 25                	jmp    1b8 <strcmp+0x38>
 193:	90                   	nop
 194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
 198:	83 c1 01             	add    $0x1,%ecx
 19b:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 19e:	0f b6 01             	movzbl (%ecx),%eax
 1a1:	84 c0                	test   %al,%al
 1a3:	74 13                	je     1b8 <strcmp+0x38>
 1a5:	0f b6 1a             	movzbl (%edx),%ebx
 1a8:	38 d8                	cmp    %bl,%al
 1aa:	74 ec                	je     198 <strcmp+0x18>
 1ac:	0f b6 db             	movzbl %bl,%ebx
 1af:	0f b6 c0             	movzbl %al,%eax
 1b2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1b4:	5b                   	pop    %ebx
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    
 1b7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b8:	0f b6 1a             	movzbl (%edx),%ebx
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	0f b6 db             	movzbl %bl,%ebx
 1c0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1c2:	5b                   	pop    %ebx
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    
 1c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <strlen>:

uint
strlen(char *s)
{
 1d0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1d1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1d3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 1d5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 1d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1da:	80 39 00             	cmpb   $0x0,(%ecx)
 1dd:	74 0c                	je     1eb <strlen+0x1b>
 1df:	90                   	nop
 1e0:	83 c2 01             	add    $0x1,%edx
 1e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1e7:	89 d0                	mov    %edx,%eax
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 55 08             	mov    0x8(%ebp),%edx
 1f6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	89 d0                	mov    %edx,%eax
 204:	5f                   	pop    %edi
 205:	5d                   	pop    %ebp
 206:	c3                   	ret    
 207:	89 f6                	mov    %esi,%esi
 209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 21a:	0f b6 10             	movzbl (%eax),%edx
 21d:	84 d2                	test   %dl,%dl
 21f:	75 11                	jne    232 <strchr+0x22>
 221:	eb 15                	jmp    238 <strchr+0x28>
 223:	90                   	nop
 224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 228:	83 c0 01             	add    $0x1,%eax
 22b:	0f b6 10             	movzbl (%eax),%edx
 22e:	84 d2                	test   %dl,%dl
 230:	74 06                	je     238 <strchr+0x28>
    if(*s == c)
 232:	38 ca                	cmp    %cl,%dl
 234:	75 f2                	jne    228 <strchr+0x18>
      return (char*)s;
  return 0;
}
 236:	5d                   	pop    %ebp
 237:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 238:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
 23a:	5d                   	pop    %ebp
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 240:	c3                   	ret    
 241:	eb 0d                	jmp    250 <atoi>
 243:	90                   	nop
 244:	90                   	nop
 245:	90                   	nop
 246:	90                   	nop
 247:	90                   	nop
 248:	90                   	nop
 249:	90                   	nop
 24a:	90                   	nop
 24b:	90                   	nop
 24c:	90                   	nop
 24d:	90                   	nop
 24e:	90                   	nop
 24f:	90                   	nop

00000250 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 251:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 253:	89 e5                	mov    %esp,%ebp
 255:	8b 4d 08             	mov    0x8(%ebp),%ecx
 258:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 259:	0f b6 11             	movzbl (%ecx),%edx
 25c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 25f:	80 fb 09             	cmp    $0x9,%bl
 262:	77 1c                	ja     280 <atoi+0x30>
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 268:	0f be d2             	movsbl %dl,%edx
 26b:	83 c1 01             	add    $0x1,%ecx
 26e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 271:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 275:	0f b6 11             	movzbl (%ecx),%edx
 278:	8d 5a d0             	lea    -0x30(%edx),%ebx
 27b:	80 fb 09             	cmp    $0x9,%bl
 27e:	76 e8                	jbe    268 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 280:	5b                   	pop    %ebx
 281:	5d                   	pop    %ebp
 282:	c3                   	ret    
 283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	53                   	push   %ebx
 298:	8b 5d 10             	mov    0x10(%ebp),%ebx
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29e:	85 db                	test   %ebx,%ebx
 2a0:	7e 14                	jle    2b6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 2a2:	31 d2                	xor    %edx,%edx
 2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 2a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b2:	39 da                	cmp    %ebx,%edx
 2b4:	75 f2                	jne    2a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    
 2ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002c0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 2c9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 2cc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 2cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2db:	00 
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 d4 00 00 00       	call   3b8 <open>
  if(fd < 0)
 2e4:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2e8:	78 19                	js     303 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ed:	89 1c 24             	mov    %ebx,(%esp)
 2f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f4:	e8 d7 00 00 00       	call   3d0 <fstat>
  close(fd);
 2f9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2fc:	89 c6                	mov    %eax,%esi
  close(fd);
 2fe:	e8 9d 00 00 00       	call   3a0 <close>
  return r;
}
 303:	89 f0                	mov    %esi,%eax
 305:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 308:	8b 75 fc             	mov    -0x4(%ebp),%esi
 30b:	89 ec                	mov    %ebp,%esp
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    
 30f:	90                   	nop

00000310 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	56                   	push   %esi
 315:	31 f6                	xor    %esi,%esi
 317:	53                   	push   %ebx
 318:	83 ec 2c             	sub    $0x2c,%esp
 31b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 31e:	eb 06                	jmp    326 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 320:	3c 0a                	cmp    $0xa,%al
 322:	74 39                	je     35d <gets+0x4d>
 324:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 326:	8d 5e 01             	lea    0x1(%esi),%ebx
 329:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 32c:	7d 31                	jge    35f <gets+0x4f>
    cc = read(0, &c, 1);
 32e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 331:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 338:	00 
 339:	89 44 24 04          	mov    %eax,0x4(%esp)
 33d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 344:	e8 47 00 00 00       	call   390 <read>
    if(cc < 1)
 349:	85 c0                	test   %eax,%eax
 34b:	7e 12                	jle    35f <gets+0x4f>
      break;
    buf[i++] = c;
 34d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 351:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 355:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 359:	3c 0d                	cmp    $0xd,%al
 35b:	75 c3                	jne    320 <gets+0x10>
 35d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 35f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 363:	89 f8                	mov    %edi,%eax
 365:	83 c4 2c             	add    $0x2c,%esp
 368:	5b                   	pop    %ebx
 369:	5e                   	pop    %esi
 36a:	5f                   	pop    %edi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	90                   	nop
 36e:	90                   	nop
 36f:	90                   	nop

00000370 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 370:	b8 01 00 00 00       	mov    $0x1,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <exit>:
SYSCALL(exit)
 378:	b8 02 00 00 00       	mov    $0x2,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <wait>:
SYSCALL(wait)
 380:	b8 03 00 00 00       	mov    $0x3,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <pipe>:
SYSCALL(pipe)
 388:	b8 04 00 00 00       	mov    $0x4,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <read>:
SYSCALL(read)
 390:	b8 05 00 00 00       	mov    $0x5,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <write>:
SYSCALL(write)
 398:	b8 10 00 00 00       	mov    $0x10,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <close>:
SYSCALL(close)
 3a0:	b8 15 00 00 00       	mov    $0x15,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <kill>:
SYSCALL(kill)
 3a8:	b8 06 00 00 00       	mov    $0x6,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <exec>:
SYSCALL(exec)
 3b0:	b8 07 00 00 00       	mov    $0x7,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <open>:
SYSCALL(open)
 3b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <mknod>:
SYSCALL(mknod)
 3c0:	b8 11 00 00 00       	mov    $0x11,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <unlink>:
SYSCALL(unlink)
 3c8:	b8 12 00 00 00       	mov    $0x12,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <fstat>:
SYSCALL(fstat)
 3d0:	b8 08 00 00 00       	mov    $0x8,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <link>:
SYSCALL(link)
 3d8:	b8 13 00 00 00       	mov    $0x13,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <mkdir>:
SYSCALL(mkdir)
 3e0:	b8 14 00 00 00       	mov    $0x14,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <chdir>:
SYSCALL(chdir)
 3e8:	b8 09 00 00 00       	mov    $0x9,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <dup>:
SYSCALL(dup)
 3f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <getpid>:
SYSCALL(getpid)
 3f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <sbrk>:
SYSCALL(sbrk)
 400:	b8 0c 00 00 00       	mov    $0xc,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <sleep>:
SYSCALL(sleep)
 408:	b8 0d 00 00 00       	mov    $0xd,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <uptime>:
SYSCALL(uptime)
 410:	b8 0e 00 00 00       	mov    $0xe,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <test>:
SYSCALL(test)
 418:	b8 16 00 00 00       	mov    $0x16,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	89 cf                	mov    %ecx,%edi
 426:	56                   	push   %esi
 427:	89 c6                	mov    %eax,%esi
 429:	53                   	push   %ebx
 42a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 42d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 430:	85 c9                	test   %ecx,%ecx
 432:	74 04                	je     438 <printint+0x18>
 434:	85 d2                	test   %edx,%edx
 436:	78 68                	js     4a0 <printint+0x80>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 438:	89 d0                	mov    %edx,%eax
 43a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 441:	31 c9                	xor    %ecx,%ecx
 443:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 446:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 448:	31 d2                	xor    %edx,%edx
 44a:	f7 f7                	div    %edi
 44c:	0f b6 92 55 08 00 00 	movzbl 0x855(%edx),%edx
 453:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 456:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 459:	85 c0                	test   %eax,%eax
 45b:	75 eb                	jne    448 <printint+0x28>
  if(neg)
 45d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 460:	85 c0                	test   %eax,%eax
 462:	74 08                	je     46c <printint+0x4c>
    buf[i++] = '-';
 464:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 469:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 46c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 46f:	90                   	nop
 470:	0f b6 04 3b          	movzbl (%ebx,%edi,1),%eax
 474:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 477:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47e:	00 
 47f:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 482:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 485:	8d 45 e7             	lea    -0x19(%ebp),%eax
 488:	89 44 24 04          	mov    %eax,0x4(%esp)
 48c:	e8 07 ff ff ff       	call   398 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 491:	83 ff ff             	cmp    $0xffffffff,%edi
 494:	75 da                	jne    470 <printint+0x50>
    putc(fd, buf[i]);
}
 496:	83 c4 4c             	add    $0x4c,%esp
 499:	5b                   	pop    %ebx
 49a:	5e                   	pop    %esi
 49b:	5f                   	pop    %edi
 49c:	5d                   	pop    %ebp
 49d:	c3                   	ret    
 49e:	66 90                	xchg   %ax,%ax
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4a0:	89 d0                	mov    %edx,%eax
 4a2:	f7 d8                	neg    %eax
 4a4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4ab:	eb 94                	jmp    441 <printint+0x21>
 4ad:	8d 76 00             	lea    0x0(%esi),%esi

000004b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bc:	0f b6 10             	movzbl (%eax),%edx
 4bf:	84 d2                	test   %dl,%dl
 4c1:	0f 84 c1 00 00 00    	je     588 <printf+0xd8>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4c7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 4ca:	31 ff                	xor    %edi,%edi
 4cc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4cf:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4d1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 4d4:	eb 1e                	jmp    4f4 <printf+0x44>
 4d6:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d8:	83 fa 25             	cmp    $0x25,%edx
 4db:	0f 85 af 00 00 00    	jne    590 <printf+0xe0>
 4e1:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e5:	83 c3 01             	add    $0x1,%ebx
 4e8:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4ec:	84 d2                	test   %dl,%dl
 4ee:	0f 84 94 00 00 00    	je     588 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 4f4:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4f6:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 4f9:	74 dd                	je     4d8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4fb:	83 ff 25             	cmp    $0x25,%edi
 4fe:	75 e5                	jne    4e5 <printf+0x35>
      if(c == 'd'){
 500:	83 fa 64             	cmp    $0x64,%edx
 503:	0f 84 3f 01 00 00    	je     648 <printf+0x198>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 509:	83 fa 70             	cmp    $0x70,%edx
 50c:	0f 84 a6 00 00 00    	je     5b8 <printf+0x108>
 512:	83 fa 78             	cmp    $0x78,%edx
 515:	0f 84 9d 00 00 00    	je     5b8 <printf+0x108>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 51b:	83 fa 73             	cmp    $0x73,%edx
 51e:	66 90                	xchg   %ax,%ax
 520:	0f 84 ba 00 00 00    	je     5e0 <printf+0x130>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 526:	83 fa 63             	cmp    $0x63,%edx
 529:	0f 84 41 01 00 00    	je     670 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 52f:	83 fa 25             	cmp    $0x25,%edx
 532:	0f 84 00 01 00 00    	je     638 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 538:	8b 4d 08             	mov    0x8(%ebp),%ecx
 53b:	89 55 cc             	mov    %edx,-0x34(%ebp)
 53e:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 542:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 549:	00 
 54a:	89 74 24 04          	mov    %esi,0x4(%esp)
 54e:	89 0c 24             	mov    %ecx,(%esp)
 551:	e8 42 fe ff ff       	call   398 <write>
 556:	8b 55 cc             	mov    -0x34(%ebp),%edx
 559:	88 55 e7             	mov    %dl,-0x19(%ebp)
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 55f:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 562:	31 ff                	xor    %edi,%edi
 564:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 56b:	00 
 56c:	89 74 24 04          	mov    %esi,0x4(%esp)
 570:	89 04 24             	mov    %eax,(%esp)
 573:	e8 20 fe ff ff       	call   398 <write>
 578:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 57b:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 57f:	84 d2                	test   %dl,%dl
 581:	0f 85 6d ff ff ff    	jne    4f4 <printf+0x44>
 587:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 588:	83 c4 3c             	add    $0x3c,%esp
 58b:	5b                   	pop    %ebx
 58c:	5e                   	pop    %esi
 58d:	5f                   	pop    %edi
 58e:	5d                   	pop    %ebp
 58f:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 590:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 593:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 596:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 59d:	00 
 59e:	89 74 24 04          	mov    %esi,0x4(%esp)
 5a2:	89 04 24             	mov    %eax,(%esp)
 5a5:	e8 ee fd ff ff       	call   398 <write>
 5aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ad:	e9 33 ff ff ff       	jmp    4e5 <printf+0x35>
 5b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5bb:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 5c0:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5c9:	8b 10                	mov    (%eax),%edx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 4d fe ff ff       	call   420 <printint>
 5d3:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5d6:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5da:	e9 06 ff ff ff       	jmp    4e5 <printf+0x35>
 5df:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 5e0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
        if(s == 0)
 5e3:	b9 4e 08 00 00       	mov    $0x84e,%ecx
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 5e8:	8b 3a                	mov    (%edx),%edi
        ap++;
 5ea:	83 c2 04             	add    $0x4,%edx
 5ed:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 5f0:	85 ff                	test   %edi,%edi
 5f2:	0f 44 f9             	cmove  %ecx,%edi
          s = "(null)";
        while(*s != 0){
 5f5:	0f b6 17             	movzbl (%edi),%edx
 5f8:	84 d2                	test   %dl,%dl
 5fa:	74 33                	je     62f <printf+0x17f>
 5fc:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          putc(fd, *s);
          s++;
 608:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 60b:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 60e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 615:	00 
 616:	89 74 24 04          	mov    %esi,0x4(%esp)
 61a:	89 1c 24             	mov    %ebx,(%esp)
 61d:	e8 76 fd ff ff       	call   398 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 622:	0f b6 17             	movzbl (%edi),%edx
 625:	84 d2                	test   %dl,%dl
 627:	75 df                	jne    608 <printf+0x158>
 629:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 62c:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 62f:	31 ff                	xor    %edi,%edi
 631:	e9 af fe ff ff       	jmp    4e5 <printf+0x35>
 636:	66 90                	xchg   %ax,%ax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 638:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 63c:	e9 1b ff ff ff       	jmp    55c <printf+0xac>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 648:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 64b:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 650:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 653:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 65a:	8b 10                	mov    (%eax),%edx
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	e8 bc fd ff ff       	call   420 <printint>
 664:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 667:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 66b:	e9 75 fe ff ff       	jmp    4e5 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 670:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        putc(fd, *ap);
        ap++;
 673:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 675:	8b 4d 08             	mov    0x8(%ebp),%ecx
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 678:	8b 02                	mov    (%edx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 67a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 681:	00 
 682:	89 74 24 04          	mov    %esi,0x4(%esp)
 686:	89 0c 24             	mov    %ecx,(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 689:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 68c:	e8 07 fd ff ff       	call   398 <write>
 691:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 694:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 698:	e9 48 fe ff ff       	jmp    4e5 <printf+0x35>
 69d:	90                   	nop
 69e:	90                   	nop
 69f:	90                   	nop

000006a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	a1 88 08 00 00       	mov    0x888,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a6:	89 e5                	mov    %esp,%ebp
 6a8:	57                   	push   %edi
 6a9:	56                   	push   %esi
 6aa:	53                   	push   %ebx
 6ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	39 c8                	cmp    %ecx,%eax
 6b3:	73 1d                	jae    6d2 <free+0x32>
 6b5:	8d 76 00             	lea    0x0(%esi),%esi
 6b8:	8b 10                	mov    (%eax),%edx
 6ba:	39 d1                	cmp    %edx,%ecx
 6bc:	72 1a                	jb     6d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6be:	39 d0                	cmp    %edx,%eax
 6c0:	72 08                	jb     6ca <free+0x2a>
 6c2:	39 c8                	cmp    %ecx,%eax
 6c4:	72 12                	jb     6d8 <free+0x38>
 6c6:	39 d1                	cmp    %edx,%ecx
 6c8:	72 0e                	jb     6d8 <free+0x38>
 6ca:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6cc:	39 c8                	cmp    %ecx,%eax
 6ce:	66 90                	xchg   %ax,%ax
 6d0:	72 e6                	jb     6b8 <free+0x18>
 6d2:	8b 10                	mov    (%eax),%edx
 6d4:	eb e8                	jmp    6be <free+0x1e>
 6d6:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 71 04             	mov    0x4(%ecx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 d7                	cmp    %edx,%edi
 6e0:	74 19                	je     6fb <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6e5:	8b 50 04             	mov    0x4(%eax),%edx
 6e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6eb:	39 ce                	cmp    %ecx,%esi
 6ed:	74 23                	je     712 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6f1:	a3 88 08 00 00       	mov    %eax,0x888
}
 6f6:	5b                   	pop    %ebx
 6f7:	5e                   	pop    %esi
 6f8:	5f                   	pop    %edi
 6f9:	5d                   	pop    %ebp
 6fa:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6fb:	03 72 04             	add    0x4(%edx),%esi
 6fe:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 701:	8b 10                	mov    (%eax),%edx
 703:	8b 12                	mov    (%edx),%edx
 705:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 708:	8b 50 04             	mov    0x4(%eax),%edx
 70b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 70e:	39 ce                	cmp    %ecx,%esi
 710:	75 dd                	jne    6ef <free+0x4f>
    p->s.size += bp->s.size;
 712:	03 51 04             	add    0x4(%ecx),%edx
 715:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 718:	8b 53 f8             	mov    -0x8(%ebx),%edx
 71b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 71d:	a3 88 08 00 00       	mov    %eax,0x888
}
 722:	5b                   	pop    %ebx
 723:	5e                   	pop    %esi
 724:	5f                   	pop    %edi
 725:	5d                   	pop    %ebp
 726:	c3                   	ret    
 727:	89 f6                	mov    %esi,%esi
 729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000730 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 739:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 73c:	8b 0d 88 08 00 00    	mov    0x888,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 742:	83 c3 07             	add    $0x7,%ebx
 745:	c1 eb 03             	shr    $0x3,%ebx
 748:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 74b:	85 c9                	test   %ecx,%ecx
 74d:	0f 84 9b 00 00 00    	je     7ee <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 753:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 755:	8b 50 04             	mov    0x4(%eax),%edx
 758:	39 d3                	cmp    %edx,%ebx
 75a:	76 27                	jbe    783 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 75c:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 763:	be 00 80 00 00       	mov    $0x8000,%esi
 768:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 76b:	90                   	nop
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 770:	3b 05 88 08 00 00    	cmp    0x888,%eax
 776:	74 30                	je     7a8 <malloc+0x78>
 778:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 77a:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 77c:	8b 50 04             	mov    0x4(%eax),%edx
 77f:	39 d3                	cmp    %edx,%ebx
 781:	77 ed                	ja     770 <malloc+0x40>
      if(p->s.size == nunits)
 783:	39 d3                	cmp    %edx,%ebx
 785:	74 61                	je     7e8 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 787:	29 da                	sub    %ebx,%edx
 789:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 78c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 78f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 792:	89 0d 88 08 00 00    	mov    %ecx,0x888
      return (void*)(p + 1);
 798:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 79b:	83 c4 2c             	add    $0x2c,%esp
 79e:	5b                   	pop    %ebx
 79f:	5e                   	pop    %esi
 7a0:	5f                   	pop    %edi
 7a1:	5d                   	pop    %ebp
 7a2:	c3                   	ret    
 7a3:	90                   	nop
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ab:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 7b1:	bf 00 10 00 00       	mov    $0x1000,%edi
 7b6:	0f 43 fb             	cmovae %ebx,%edi
 7b9:	0f 42 c6             	cmovb  %esi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 7bc:	89 04 24             	mov    %eax,(%esp)
 7bf:	e8 3c fc ff ff       	call   400 <sbrk>
  if(p == (char*)-1)
 7c4:	83 f8 ff             	cmp    $0xffffffff,%eax
 7c7:	74 18                	je     7e1 <malloc+0xb1>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7c9:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 7cc:	83 c0 08             	add    $0x8,%eax
 7cf:	89 04 24             	mov    %eax,(%esp)
 7d2:	e8 c9 fe ff ff       	call   6a0 <free>
  return freep;
 7d7:	8b 0d 88 08 00 00    	mov    0x888,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 7dd:	85 c9                	test   %ecx,%ecx
 7df:	75 99                	jne    77a <malloc+0x4a>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7e1:	31 c0                	xor    %eax,%eax
 7e3:	eb b6                	jmp    79b <malloc+0x6b>
 7e5:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	89 11                	mov    %edx,(%ecx)
 7ec:	eb a4                	jmp    792 <malloc+0x62>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7ee:	c7 05 88 08 00 00 80 	movl   $0x880,0x888
 7f5:	08 00 00 
    base.s.size = 0;
 7f8:	b9 80 08 00 00       	mov    $0x880,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7fd:	c7 05 80 08 00 00 80 	movl   $0x880,0x880
 804:	08 00 00 
    base.s.size = 0;
 807:	c7 05 84 08 00 00 00 	movl   $0x0,0x884
 80e:	00 00 00 
 811:	e9 3d ff ff ff       	jmp    753 <malloc+0x23>
